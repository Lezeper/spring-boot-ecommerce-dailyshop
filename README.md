# JEE Project - eCommerce

###IDE
		Spring Tool Suite (Eclipse)

###Dependencies
		Spring Boot
		Spring Security
		Spring Data JPA
		Spring Cloud AWS
		JavaMail
		Hibernate
		AngularJS
		Bootstrap
		JSP view layer
		MySQL-connector

###Structure
##### Resources
		css - css file
		fonts - font awesome
		images - product images
		img - layout related images
		js - js file
		less/scss - bootstrap related

###API
##### Get
		/admin/** - admin login required
		
		/admin/pd/m - product management page
		/admin/pd/s (?id=) - save product, (create or update)
		/admin/pd/d?id=	- delete product
		
		/admin/ca/m s (?id=) (d?id=) - category management
		/admin/hs/m s (?id=) (d?id=) - home slider management
		/admin/cu/m (d?id=) (e?id=) (ds?id=) - customer management, remove, enable, disable
		
		/login - login page
		/logout - redirect to login page
		/register - register page
		/ - home page
		/version - history version information
		/contact - contact page
		
		/pd/s - show all products
		/pd/s?na=, ?mc, ?st, ?sc, ?t, ?lp , ?hp 
							- name, mainCategory, sortType, subCategory, tag, lowerPrice, higherPrice
		/pd/p?id - specific item page (id required)
		
		/customer/** - user login required
		/customer/cart - get customer cartId, redirect to cart page
		/customer/cart/{cartId} - cart page
		/customer/account - customer account page
		
		/rest/cart	- user cart page
		
		
##### Post
		/products/view?id {productComment} - add product comment
		/register {user} - add new user (default: 'ROLE_USER', enabled)
		
		/rest/cart/add/{productId} - add product to cart
		/rest/cart/remove/{carItemId} - remove specific cartItem
		/rest/cart/edit/{carItemId} - edit specific cartItem

###Function lists
##### Login/Register
		* Login/Register validate
		* Login/register page(POST) forbidden when already login
		* Password Encoder Bcrypt
		* Auto login after registering and reset password
		* Confirm Email address (Through link with Active code)
		* Retrieve password (Through link with Reset Password code)
##### Home Page
		* 
##### Product Page
		* Product filter by name, mainCategory, subCategory, tag, Price(Custom), Date
		* Product sort by product price	(BackEnd Side)
		* The number of products shows	(FrontEnd Side)
##### Admin Page
		* CRUD, Validate: Product,Category,HomeSlider
		* Disable/Enable user, delete user. 
		* 
