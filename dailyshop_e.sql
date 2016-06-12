-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2016 at 01:44 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dailyshop_e`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` bigint(20) NOT NULL,
  `grand_total` double NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `grand_total`, `customer_id`) VALUES
(5, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE IF NOT EXISTS `cart_item` (
  `cart_item_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price_double` double NOT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` bigint(20) NOT NULL,
  `main_category_name` varchar(255) NOT NULL,
  `sub_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `main_category_name`, `sub_category_name`) VALUES
(1, 'Women', 'Jeans'),
(2, 'Women', 'Shirtdress'),
(3, 'Men', 'T-shirt'),
(4, 'Men', 'Trousers'),
(6, 'Men', 'Shoes'),
(7, 'Women', 'Shoes');

-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE IF NOT EXISTS `code` (
  `code_id` bigint(20) NOT NULL,
  `code_date` datetime DEFAULT NULL,
  `code_str` varchar(255) DEFAULT NULL,
  `code_type` int(11) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` bigint(20) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` datetime DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `email`, `enabled`, `password`, `register_date`, `cart_id`) VALUES
(5, 'YUHAO MA', 'lewis_studio@yahoo.com', b'1', '$2a$10$xce0uwZMVeNfLAxx7UvPJ.FfBfwC9/wlkfpvwqMAnt8AopEIOC7FK', '2016-06-11 18:48:49', 5);

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE IF NOT EXISTS `customer_order` (
  `customer_order_id` bigint(20) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_total_price` double NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`customer_order_id`, `order_date`, `order_total_price`, `customer_id`, `address_id`) VALUES
(26, '2016-06-11 19:19:05', 82.99, 5, 13);

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_item`
--

CREATE TABLE IF NOT EXISTS `customer_order_item` (
  `customer_order_item_id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `customer_order_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order_item`
--

INSERT INTO `customer_order_item` (`customer_order_item_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `customer_order_id`) VALUES
(18, 29, ' RACHEL Rachel Roy Three-Quarter-Sleeve Shirtdress', 82.99, 1, 26);

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_shipping_address`
--

CREATE TABLE IF NOT EXISTS `customer_order_shipping_address` (
  `address_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `customer_order_id` bigint(20) DEFAULT NULL,
  `original_shipping_address_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order_shipping_address`
--

INSERT INTO `customer_order_shipping_address` (`address_id`, `address`, `city`, `country`, `full_name`, `phone_number`, `state`, `zip_code`, `customer_order_id`, `original_shipping_address_id`) VALUES
(13, '450 W 42nd ST Apt 9F', 'New York', 'United States', 'YUHAO MA', '6462668366', 'New York (NY)', '10036', 26, 13);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` bigint(20) NOT NULL,
  `product_condition` varchar(255) NOT NULL,
  `product_date` datetime DEFAULT NULL,
  `product_description` text,
  `product_name` varchar(255) NOT NULL,
  `product_price` double NOT NULL,
  `product_summary` varchar(255) DEFAULT NULL,
  `product_tagsw` varchar(255) DEFAULT NULL,
  `product_views` bigint(20) NOT NULL DEFAULT '0',
  `unit_in_stock` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_condition`, `product_date`, `product_description`, `product_name`, `product_price`, `product_summary`, `product_tagsw`, `product_views`, `unit_in_stock`, `category_id`) VALUES
(26, 'new', '2016-05-01 00:00:00', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Levi''s 710 Super Skinny Jeans', 50, 'Levi''s 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.', NULL, 38, 10, 1),
(27, 'new', '2016-05-10 00:00:00', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Style & Co. Tummy-Control Bootcut Jeans', 28.99, 'Sport sleek modern denim in Style&co.''s bootcut jeans featuring a flattering rinse wash and tummy-control design.', NULL, 14, 5, 1),
(28, 'new', '2016-03-16 00:00:00', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Celebrity Pink Juniors'' Skinny Jeans, Colored Wash', 24.99, 'Favorite skinny jeans from Celebrity Pink Jeans, updated with a summer-ready color!', NULL, 7, 0, 1),
(29, 'new', '2016-06-08 22:03:02', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', ' RACHEL Rachel Roy Three-Quarter-Sleeve Shirtdress', 82.99, 'With a flowing fit and trend-right three-quarter sleeves this Rachel Rachel Roy shirtdress is a chic addition to your collection.', '', 46, 5, 2),
(30, 'new', '2016-06-08 22:03:14', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'BCX Juniors'' Lace-Trim Belted Shirtdress', 34.99, 'A no-fuss look for 9 to 5, BCX''s refreshed shirtdress is styled with roll-tab sleeves, a braided faux-leather belt and crochet trim at the back and shoulders.', '', 12, 50, 2),
(31, 'new', '2016-06-08 22:03:23', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Tommy Hilfiger Polka-Dot Chambray Shirtdress', 46.99, 'Hit all the right style marks in Tommy Hilfiger''s polka-dot button-down shirt dress.', '', 43, 2, 2),
(33, 'new', '2016-06-08 22:03:35', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Alfani Slim Fitted V-Neck T-Shirt', 10.99, 'The perfect silhouette teams with a super-soft look and feel, taking Alfani slim V-neck tee way beyond basic.', '', 41, 55, 3),
(34, 'new', '2016-06-08 22:03:42', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Nike Men''s Pro Cool Fitted Dri-FIT Shirt', 22.4, 'Move without restriction in Nike''s Pro Cool shirt, cut with Dri-FIT and mesh fabrics to help you stay dry and cool so your performance remains at its peak.', '', 6, 77, 3),
(35, 'new', '2016-06-08 22:03:50', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Nike Men''s Dri-Fit 2.0 T-Shirt', 19.99, 'The Nike Dri-FIT Version 2.0 Men''s T-Shirt offers an athletic look and comfortable fit with a famous logo on a sweat-wicking cotton blend.', '', 1, 1, 3),
(36, 'new', '2016-06-08 22:04:00', 'Levi''sÂ® 710 super skinny jeans provide a seriously sexy fit, made with advanced stretch denim for maximum comfort.\r\nMid rise: waistband sits below natural waist\r\nSkinny fit through hips and thighs\r\nSkinny leg\r\nButton closure with zip fly; belt loops\r\nFive-pocket styling\r\nAvailable in multiple washes\r\nCuffed hem; not sewn\r\nAvailable in approx. inseam: 28â?? (S), 30â?? (R), 32â?? (L)\r\nIf you liked the Mid-Rise Skinny, youâ??ll love our new Lot 700 seriesâ??designed to flatter, hold and lift.\r\nCotton/polyester/elastane\r\nMachine washable\r\nImported\r\nLevi''s Denim Fit Guide\r\nWeb ID: 2631998', 'Levi''s Men''s 511 Slim-Fit Stretch Hybrid Trousers', 58.99, 'These Levi''s 511 trousers are cut from stretch, lightweight twill cotton fabric in a slim-fit silhouette with a slightly tapered leg for cool style and a flattering fit.', '', 58, 66, 4),
(37, 'new', '2016-06-08 22:04:13', 'TO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or APO/FPO addresses. Restricted items include aerosols, pressurized spray cans and alcohol-based products (hairspray, nail polish, nail polish remover, shaving cream, etc.). Due to air transport restrictions and regulations, these items are required by the U.S. Department of Transportation to be shipped by Standard Ground Shipping only. These restricted items are not eligible for Premium or Overnight Shipping. TO GET FREE RETURNS: You can return merchandise by mail or in store for a full refund, which will be credited on your original tender. Free Returns exclude gift cards, food, gourmet gifts, lamps, wall art, mirrors, furniture, mattresses & area rugs. Does not apply to international orders. Gift returns or orders with different shipping & billing informationâ??or if you paid with a Gift Cardâ??are refunded on an Easy Exchange Card, which you can use for future online or in-store purchases.', 'Volcom Men''s Vorta Slim Straight-Fit Twill Trousers', 29.99, 'Pair these slim straight fit twill trousers from Volcom with a button-down for a casual yet polished work or weekend look.', '', 27, 12, 4),
(38, 'new', '2016-06-08 22:04:27', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'GUESS Slim-Straight-Fit Denim First Take Trouser', 57.99, 'Pair these slim-straight fit denim trousers from GUESS with a button-down for a casual yet polished work or weekend look.', '', 13, 32, 4),
(39, 'new', '2016-06-08 22:04:56', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'Reebok Women''s ZPrint Running Sneakers', 79.99, 'Featuring an all-new advanced running platform, the Women''s Reebok ZPrint Running Sneakers take your running to comfortable new heights. ', '', 34, 133, 7),
(40, 'new', '2016-06-08 22:05:03', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'Reebok Women''s ZPrint Running Sneakers', 79.99, 'Featuring an all-new advanced running platform, the Women''s Reebok ZPrint Running Sneakers take your running to comfortable new heights.', '', 39, 332, 7),
(41, 'new', '2016-06-08 22:05:11', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'Reebok Men''s ZPrint Run Running Sneakers', 79.99, 'Featuring an all-new advanced running platform, the Men''s Reebok ZPrint Running Sneakers take your running to comfortable new heights.', '', 1, 23, 6),
(42, 'new', '2016-06-08 22:05:32', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'adidas Men''s Solar Boost Running Sneakers', 99.99, 'Boost your run in the advanced adidas Men''s Solar Boost Running Sneakers. Featuring a braided mesh upper that offers an iridescent look, these running sneakers have style for miles.', '', 2, 32, 6),
(43, 'new', '2016-06-08 22:05:24', 'Enjoy free shipping on your purchase of $25 or more!\r\nTO GET FREE SHIPPING WITH $25 PURCHASE: Place $25 of qualifying items in shopping bag. No promo code needed. Ends May 7, 2016. The minimum purchase amount for Free Shipping does not include gift wrap charges, purchases of Gift Cards or tax. Offer applies to Standard Shipping to one location and may be applied to Premium or Overnight Shipping for an upgrade fee. Free Shipping does not apply to furniture, mattresses, purchases in Macy''s stores, prior purchases or international orders. Due to size and/or weight, certain items bear a shipping surcharge, which will still apply. When shipping to multiple addresses, only shipping to the first address will qualify for Free Shipping; Standard Shipping will apply to all other addresses. Free Shipping cannot be applied to purchases being shipped to U.S. territories or ', 'adidas Men''s Rocket Boost Running Sneakers', 119.99, 'You can always use a little boost in your run. Lace up the adidas Men''s Rocket Boost running sneakers for a smooth ride that will leave you hungry for more miles. ', '', 1, 111, 6);

-- --------------------------------------------------------

--
-- Table structure for table `product_comment`
--

CREATE TABLE IF NOT EXISTS `product_comment` (
  `comment_id` bigint(20) NOT NULL,
  `comment_cotents` text,
  `comment_date` datetime DEFAULT NULL,
  `comment_starts` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE IF NOT EXISTS `product_tag` (
  `tag_id` bigint(20) NOT NULL,
  `tag_contents` varchar(255) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` bigint(20) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `authority`, `email`, `customer_id`) VALUES
(12, 'ROLE_USER', 'lewis_studio@yahoo.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_address`
--

CREATE TABLE IF NOT EXISTS `shipping_address` (
  `address_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping_address`
--

INSERT INTO `shipping_address` (`address_id`, `address`, `city`, `country`, `full_name`, `is_default`, `phone_number`, `state`, `zip_code`, `customer_id`) VALUES
(13, '450 W 42nd ST Apt 9F', 'New York', 'United States', 'YUHAO MA', b'1', '6462668366', 'New York (NY)', '10036', 5);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `slider_id` bigint(20) NOT NULL,
  `slider_description` varchar(255) DEFAULT NULL,
  `slider_link` varchar(255) NOT NULL,
  `slider_title` varchar(255) NOT NULL,
  `slider_upper_data` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slider_id`, `slider_description`, `slider_link`, `slider_title`, `slider_upper_data`) VALUES
(4, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi, veritatis quae repudiandae quod nulla porro quidem, itaque quis quaerat!', '', 'All Products', 'SAVE UP TO 30% OFF'),
(5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi, veritatis quae repudiandae quod nulla porro quidem, itaque quis quaerat!', 'women', 'Women-Clothing', 'SAVE UP TO 50% OFF'),
(6, 'Men''s Suit & Menswear Retail Clothing Company', 'men', 'Men Clothing', 'SAVE UP TO 70% OFF');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `FK_867x3yysb1f3jk41cv3vsoejj` (`customer_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `FK_n7d76evrrkrg1cva2ewnh57hn` (`cart_id`),
  ADD KEY `FK_r5b99rvdnupujm2h7hh2bh6m7` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD PRIMARY KEY (`code_id`),
  ADD KEY `FK_k6x8c6off4frbk34ax4usk10` (`customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `FK_g9sk3sbpw80xw32a5b435qvw2` (`cart_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`customer_order_id`),
  ADD KEY `FK_puwshb8ptuseofvg0vd8iktd5` (`customer_id`),
  ADD KEY `FK_qigvnreb2wbokr9mqqnr1b7k0` (`address_id`);

--
-- Indexes for table `customer_order_item`
--
ALTER TABLE `customer_order_item`
  ADD PRIMARY KEY (`customer_order_item_id`),
  ADD KEY `FK_ptkdcent0wqq1itoh7fwulg9` (`customer_order_id`);

--
-- Indexes for table `customer_order_shipping_address`
--
ALTER TABLE `customer_order_shipping_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `FK_1f6wj53n4da2g1kj8ec3wlnep` (`customer_order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_ibfk_1` (`category_id`);

--
-- Indexes for table `product_comment`
--
ALTER TABLE `product_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `FK_par4rgtlb93x4i01q3x333c19` (`product_id`),
  ADD KEY `FK_2iahns69ci0yvpqggvwh476ar` (`customer_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `FK_2rkcr5ky2nboypb8b67s7ixai` (`product_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`),
  ADD KEY `FK_1gjlkmfrx4nrb14hjkb99rb1a` (`customer_id`);

--
-- Indexes for table `shipping_address`
--
ALTER TABLE `shipping_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `FK_g6538l115arvyc2vcky8ld32o` (`customer_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `code`
--
ALTER TABLE `code`
  MODIFY `code_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `customer_order_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `customer_order_item`
--
ALTER TABLE `customer_order_item`
  MODIFY `customer_order_item_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `customer_order_shipping_address`
--
ALTER TABLE `customer_order_shipping_address`
  MODIFY `address_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `product_comment`
--
ALTER TABLE `product_comment`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `tag_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `shipping_address`
--
ALTER TABLE `shipping_address`
  MODIFY `address_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_867x3yysb1f3jk41cv3vsoejj` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FK_n7d76evrrkrg1cva2ewnh57hn` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_r5b99rvdnupujm2h7hh2bh6m7` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `code`
--
ALTER TABLE `code`
  ADD CONSTRAINT `FK_k6x8c6off4frbk34ax4usk10` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_g9sk3sbpw80xw32a5b435qvw2` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `FK_puwshb8ptuseofvg0vd8iktd5` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_qigvnreb2wbokr9mqqnr1b7k0` FOREIGN KEY (`address_id`) REFERENCES `customer_order_shipping_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_order_item`
--
ALTER TABLE `customer_order_item`
  ADD CONSTRAINT `FK_ptkdcent0wqq1itoh7fwulg9` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`customer_order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_order_shipping_address`
--
ALTER TABLE `customer_order_shipping_address`
  ADD CONSTRAINT `FK_1f6wj53n4da2g1kj8ec3wlnep` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`customer_order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_comment`
--
ALTER TABLE `product_comment`
  ADD CONSTRAINT `FK_2iahns69ci0yvpqggvwh476ar` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `FK_par4rgtlb93x4i01q3x333c19` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `FK_2rkcr5ky2nboypb8b67s7ixai` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `FK_1gjlkmfrx4nrb14hjkb99rb1a` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shipping_address`
--
ALTER TABLE `shipping_address`
  ADD CONSTRAINT `FK_g6538l115arvyc2vcky8ld32o` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
