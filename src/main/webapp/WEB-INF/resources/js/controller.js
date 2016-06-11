$("#quantity").keypress(function (evt) {
    evt.preventDefault();
});

function click_selected_quantity(el) {
    var productInfo = $("#product-info-" + $(el).attr("productId"));

    var stock = productInfo.attr("stock");
    var quantity = parseInt(productInfo.attr("quantity"), 10);
    var code = "";
    for(var i = 1; i <= stock; i++){
        if (i >= 10){
            code = code.concat("<option value='10+'>10+</option>");
            break;
        }else{
            if (quantity == i){
                code = code.concat("<option value='"+ i +"' selected>" + i + "</option>");
            }else{
                code = code.concat("<option value='"+ i +"'>" + i + "</option>");
            }
        }
    }
    $(el).empty();
    $(el).append(code);
}

//------------------------------------------- Angular -------------------------------------------------
var myApp = angular.module("myApp", []);

myApp.controller("searchCtrl", function($scope, $http){
	
	$scope.search = function(){
		if($scope.keyword){
			window.location.href = "/pd/s?na="+$scope.keyword;
		}
	}
});

myApp.controller("overViewsCtrl", function($scope, $http){
	
	$scope.reSendDisabled = false;
	
	$scope.reSendActiveCode = function(){
		$scope.reSendDisabled = true;
		$http.get('/customer/account/rsac').then(function () {
			
        });
	}
});

myApp.controller("registerCtrl", function($scope, $http){
});
//-------- findPassword.jsp -----------
myApp.controller("fpCtrl", function($scope, $http){
	$scope.sendReady = false;
	$scope.fpShow = true;
	
	$scope.sendResetPasswordEmail = function(){
		
		$http.get('/fp', {params: {'email': $scope.email}}).then(function (res) {
			if(res.data){
				$scope.sendReady = true;
				$scope.fpShow = false;
			}
        });
	}
});


myApp.controller("cartCtrl", function ($scope, $http) {
	
    $scope.update_quantity = function (productId, cartItemId, csrf) {
        var quantity = $("#update-quantity-"+cartItemId).val();
        var productInfo = $("#product-info-" + productId);
        var stock = productInfo.attr("stock");
        
        if(stock >= quantity && quantity >= 1){
            $("#quantity-error-cart-"+cartItemId).text();
            $http.put('/rest/cart/' + cartItemId +"?q=" + quantity + "&" + csrf).success(function () {
                $scope.refreshCart();
            });
            $("#selector-quantity-"+cartItemId).show();
            $("#update-quantity-div-"+cartItemId).hide();
        }else{
            $("#quantity-error-cart-"+cartItemId).text("Only " + stock + " in Stock!");
        }
    };

    $scope.selected_quantity = function (cartItemId, csrf) {
    	
        if (this.item.selectedOption == "10+"){
            $("#selector-quantity-"+cartItemId).hide();
            $("#update-quantity-div-"+cartItemId).show();
        }else{
            var quantity = parseInt(this.item.selectedOption, 10);
            if(isNaN(quantity)){
                alert("isNaN(quantity)");
            }

            $http.put('/rest/cart/' + cartItemId +"?q=" + quantity + "&" + csrf).success(function () {
                $scope.refreshCart();
            });
        }
    };

    $scope.refreshCart = function () {
        $http.get('/rest/cart').success(function (data) {
            $scope.cart = data;
        });
    };

    $scope.clearCart = function () {
        $http.delete('/rest/cart').success($scope.refreshCart());
    };

    $scope.addToCart = function (productId, csrf) {
        var quantity = parseInt($("#quantity").val(), 10);
        if(isNaN(quantity)){
            quantity = 1;
        }

        $http.post('/rest/cart/' + productId +"?q=" + quantity + "&" + csrf).success(function () {
        	$scope.refreshCart();
        	window.location.href = "/customer/cart";
        });
    };

    $scope.removeFromCart = function (productId, csrf) {
        $http.delete('/rest/cart/' + productId + "?" + csrf).success(function () {
            $scope.refreshCart();
        });
    };

    $scope.calGrandTotal = function () {
        var grandTotal = 0;
        if($scope.cart){
            for(var i=0; i<$scope.cart.cartItems.length; i++){
                grandTotal+=$scope.cart.cartItems[i].totalPriceDouble;
            }
            return parseFloat(grandTotal).toFixed(2);
        }
    };

    $scope.converDouble = function (total) {
        return parseFloat(total).toFixed(2);
    }
});

//------------------------------------ noUiSlider ---------------------------------------------------
/*
var slider = document.getElementById('price-slider');

noUiSlider.create(slider, {
    start: [20, 50],
    step: 10,
    connect: true,
    range: {
        'min': 0,
        'max': 100
    }
});

var valueLower = document.getElementById('skip-value-lower');
var valueUpper = document.getElementById('skip-value-upper');

// When the slider value changes, update the input and span
slider.noUiSlider.on('update', function( values, handle ) {
    if ( handle ) {
        valueUpper.value = values[handle];
    } else {
        valueLower.value = values[handle];
    }
});
*/
//---------------------------------------- Pagination -----------------------------------------------------
function pagination(page, pageTotal, productNumbers) {
    if (page == 0){
        // next page
        page = parseInt($("#current-page-number").val(), 10)+1;
    }
    if (page == -1){
        // previous page
        page = parseInt($("#current-page-number").val(), 10)-1;
    }

    var selectedShows = parseInt($("#numberShows").find(":selected").text(), 10);

    for ( var j = 1; j <= (page-1)*selectedShows; j++){
        $("#product-li-number-"+j).hide();
    }
    for ( var k = page*selectedShows+1; k <= productNumbers; k++){
        $("#product-li-number-"+k).hide();
    }

    for(var i = 1; i <= productNumbers; i++){
        if( i <= (page-1)*selectedShows || i > page*selectedShows){
            $("#product-li-number-"+i).hide();
        }
        if( i > (page-1)*selectedShows && i <= page*selectedShows){
            $("#product-li-number-"+i).show();
        }
        $("#page-number-"+i).css({"background-color":"white", "color":"#888"});
    }
    $("#page-number-"+page).css({"background-color":"#ff6666", "color":"white"});
    var onclick = "";
    if (page != 1 && $("#previous-page-li").length == 0){
        onclick = "onclick='pagination(-1," + pageTotal + "," + productNumbers + ")'";
        var previous = "<li><a style='cursor: hand' "+ onclick +" id='previous-page-li' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
        $("#pagination-ul").prepend(previous);
    }
    if(page != pageTotal && $("#next-page-li").length == 0){
        onclick = "onclick='pagination(0," + pageTotal + "," + productNumbers + ")'";
        var next = "<li><a style='cursor: hand' id='next-page-li' "+onclick+" aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
        $("#pagination-ul").append(next);
    }
    if(page == 1){
        $("#previous-page-li").remove();
    }
    if(page == pageTotal){
        $("#next-page-li").remove();
    }
    $("#current-page-number").val(page);
}

function rePagination(productNumbers) {
    var page = 1;
    var selectedShows = parseInt($("#numberShows").find(":selected").text(), 10);
    var pageTotal = Math.ceil(productNumbers/selectedShows);

    $("#pagination-ul").empty();
    for (var i = 1; i <= pageTotal; i++){
        if (i == 1){
            var append_content = "<li><a id='page-number-"+ i +"' style='cursor: hand; " +
                "background-color:#ff6666; color:white ' onclick='pagination("+ i +","+
                pageTotal+","+productNumbers+")'>"+ i + "</a></li>";
        }else{
            var append_content = "<li><a id='page-number-"+ i +"' style='cursor: hand' onclick='pagination("+
                i+","+pageTotal+","+productNumbers+")'>"+ i + "</a></li>";
        }
        $("#pagination-ul").append(append_content);
    }
    pagination(page, pageTotal, productNumbers);
}
//--------------------------------------------------------------------------------------------------------------
function sortBy(el) {
    window.location.href = $(el).find(":selected").val();
}

function customPriceRage() {
    if($('#custom-price-range-div').is(':hidden')){
        $('#custom-price-range-div').show('fast');
    }else{
        $('#custom-price-range-div').hide('fast');
    }
}

function PriceRangeLink(max,lp) {
    if(lp.split('&hp=')[1]){
        var after = lp.split('&hp=')[1];
        var previousMax = 0;
        if(after.indexOf("&") == -1){
            // last param
            previousMax = after;
        }else{
            previousMax = after.slice(0, after.indexOf("&")+1);
        }
        window.location.href = lp.replace("&hp="+previousMax, "&hp="+max);
    }else{
        window.location.href = lp+"&hp="+max;
    }
}

function customPriceRageGo(lp) {
    var lower = $("#skip-value-lower").val();
    var higher = $("#skip-value-upper").val();
    if(parseInt(lower, 10) > parseInt(higher,10)){alert("Return False. Reason: Min > Max"); return false;}
    if(!lower){alert("Return False. Reason: Min can not be null."); return false;}
    if(!higher){alert("Return False. Reason: Max can not be null."); return false;}

    if(lp.split('lp=')[1]){
        var after = lp.split('lp=')[1];
        var previousMin = 0;
        if(after.indexOf("&") == -1){
            // last param
            previousMin = after;
        }else{
            previousMin = after.slice(0, after.indexOf("&")+1);
        }
        lp = lp.replace("lp="+previousMin, "lp="+lower+"&");
    }else{
        lp = lp+lower;
    }
    PriceRangeLink(higher, lp);
}

function PriceRangeRadio(el,lp) {
    var max = $(el).attr("max");
    PriceRangeLink(max, lp);
}
//------------------------------------------- Review --------------------------------------------------
function add_review(name) {
    if(name == null || name == ''){
        alert("Please Login in");
    }else{
        if($("#add-review-div").is(':hidden')){
            $("#add-review-div").show('fast');
        }else{
            $("#add-review-div").hide('fast');
        }
    }
}

function productCommentOnClick(el) {
    var starts = parseInt($(el).attr("starts"),10);
    $("#commentStarts-hidden").val(starts);
    for(var i = 1; i <= 5;i++){
        if(i <= starts){
            $("#starts-number-"+i).attr("class", "fa fa-star")
        }else{
            $("#starts-number-"+i).attr("class", "fa fa-star-o")
        }
    }
}