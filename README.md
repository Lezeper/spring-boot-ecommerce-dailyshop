# JEE Project - eCommerce

###IDE
		Spring Tool Suite (Eclipse)

###Main Dependencies
		Spring Boot
		Spring Security
		Spring Web Flow
		Spring Data JPA
		Spring Cloud AWS
		JavaMail
		Hibernate
		AngularJS
		Bootstrap
		JSTL
		MySQL-connector
		
###Finished Function
		* Login/Register validate
		* Login/register page(POST) forbidden when already login
		* Password Encoder Bcrypt
		* Auto login after registering and reset password
		* Confirm Email address (Through link with Active code)
		* Retrieve password (Through link with Reset Password code)
		* Product search, filter, sorting, classify
		* Product details, Product Reviews(User comments)
		* Shipping Cart System
		* Admin manage products/Home slider/Product Category/User

###Further Function
		* Payment System (+Billing Address), improve Checkout Page
		* Improve "My Account", footer information, contact page
		* Coupon System, Points System
		* Views history
		* Recommendation System - Hadoop

###DB Structure
![alt tag](http://imlewis.com/sql.jpg)

###Roles
		* ROLE_UNAUTH - user registered but not yet confirm email
		* ROLE_USER - user already confirm email
		* ROLE_ADMIN - full authority to controller the whole web

###Authority
		* /admin/** - [ROLE_ADMIN] required
		* /checkout - [ROLE_USER] required
		* /customer/** - [ROLE_UNAUTH] or [ROLE_USER] required

###Link
##### Admin Page Links
		/admin/pd/m - product management page
		/admin/pd/s (?id=) - save product, (create or update)
		/admin/pd/d?id=	- delete product
		
		/admin/ca/m s (?id=) (d?id=) - category management
		/admin/hs/m s (?id=) (d?id=) - home slider management
		/admin/cu/m (d?id=) (e?id=) (ds?id=) - customer management, remove, enable, disable
##### Home page Links
		/ - home page
		/version - history version information
		/contact - contact page
##### Product Page Links
		/pd/s - show all products
		/pd/s?na=, ?mc, ?st, ?sc, ?t, ?lp , ?hp 
							- name, mainCategory, sortType, subCategory, tag, lowerPrice, higherPrice
		/pd/p?id - specific item page (id required)
		/pd/p?id {productComment} - POST - add product comment - [ROLE_USER] required
##### Customer Page Links
		/customer/cart - get customer cartId, redirect to cart page
		/customer/account - customer account page
		/customer/account/rsac	- reSend active code
##### Shopping cart Links
		/rest - restful API
		/rest/cart - cart API (GET: return cart object)
		/rest/cart/{productId}?q= - POST - (quantity), add cartItem
		/rest/cart/{cartItemId}?q= - PUT - (quantity required) update cartItem
		/rest/cart/{cartItemId} - Delete - delete cartItem
##### Other Links
		/login - login page
		/logout - redirect to login page
		/register - register page
		/register {user} - POST - add new user (default: 'ROLE_UNAUTH', enabled)
		/rp/{codeStr} - GET - reset password page
		/fp - GET - find password page
		/rg/{codeStr} - GET - active account

###CheckOut WebFlow
![alt tag](http://imlewis.com/checkoutflow.jpg)

###BUGS
		* CartItem Update Button can't handle the number of quantity over 100
		* The controller in cart page can't synchronized update with header cart Controller 
		* Need to logout and login again to change the user authority.
