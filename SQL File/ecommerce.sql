-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2021 at 04:22 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Peta'),
(2, 'Purr'),
(3, 'PetStore'),
(4, 'Woof'),
(5, 'Toys4Pet'),
(6, 'Meow');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(158, 82, '::1', 26, 1),
(159, 83, '::1', 26, 1),
(161, 83, '::1', 28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Dog'),
(2, 'Cats'),
(3, 'Birds'),
(4, 'Fish'),
(5, 'Turtle'),
(6, 'Reptiles'),
(7, 'Hamster');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(6, 'rodricksryan10@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(2, 26, 'Ryan Rodricks', 'rodricksryan10@gmail.com', 'chembur', 'mumbai', 'wf', 213223, 'ewea', '12324242422132', '12/22', 2, 950, 3432),
(3, 26, 'Ryan Rodricks', 'rodricksryan10@gmail.com', 'chembur', 'mumbai', 'maga', 400081, 'gvbujh', '1234567890123456', '12/22', 1, 560, 123),
(4, 26, 'Ryan Rodricks', 'rodricksryan10@gmail.com', 'chembur', 'mumbai', 'Maharashtra', 400071, 'gvbujh', '1234567890123456', '12/22', 1, 560, 123),
(5, 28, 'Ryan Rodricks', 'd2019ryan.rodricks@gmail.com', 'chembur', 'mumbai', 'Maharashtra', 400071, 'gvbujh', '1234556', '12/22', 2, 955, 123);

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 87, 1, 500),
(92, 2, 84, 1, 450),
(93, 3, 82, 1, 560),
(94, 4, 82, 1, 560),
(95, 5, 83, 5, 1975),
(96, 5, 82, 1, 560);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(82, 1, 1, 'Premium Dog  Leash', 560, 'About this item\r\nLeashes are ideal for small dogs. Automatic retractable rope. It can reach a weight of 10kg. The full-leash design and heavy-duty internal spring can easily cope with dogs.\r\nComfortable experience: compact, light and easy to operate, this belt is very suitable for medium and petite hands.\r\nDurable material: environmentally friendly and durable ABS shell with modern appearance, non-corrosive stainless steel internal spring and high-strength nylon belt\r\nBrake and lock safety system: a smooth and simple one-button lock system ensures that the belt length can be adjusted as required. One-handed operation makes you feel good\r\nImproved swivel buckle and full leash design: reduce tangles when the dog is walking.\r\nThe design of the product may vary as per availability', '1630823536_leesh.jpg', 'leashes'),
(83, 1, 3, 'Pet Cone E-Collar Protective', 395, 'Pet Cone E-Collar Protective Collar Wound Healing Cone Protection Smart Collar Compatible with Pet.', '1630825404_714bpcdRQ+L._SL1100_.jpg', 'collar '),
(84, 2, 2, 'The Pets Company Rod Cat Bell Dangler', 450, 'About this item\r\nRod Dangler cat toy with enticing feather tail on end!\r\nInteractive cat toy that will bring your cat(s) hours of fun\r\nExcellent and safe way to exercise your cats', '1630826397_61nvQO2yejL._SL1080_.jpg', 'cat'),
(85, 2, 2, 'Kiki N Pooch Catch The Mouse Cat Toy', 233, 'a cat toy\r\n', '1630827804_41RML2afAvL.jpg', 'mouse'),
(86, 3, 3, ' PetNest® Breeding Box Bird Nest', 566, 'Breeding box for birds, very comfortable cheap and premium quality', '1630828013_817-Stt46+L._SL1500_.jpg', 'bird'),
(87, 4, 5, 'Jainsons Pet Products® Desolate', 500, 'Aquarium Decorative product\r\nType:Decorative Ornaments/Toy\r\nSize : LXBXH 20X11X30 cm\r\nMaterial: Resin\r\nPackage Contents:1 Piece', '1630828213_71Udqs0YlDL._SY450_.jpg', 'fish'),
(88, 5, 3, 'DR FISH Turtle Food Specialists (250 g)', 222, 'Complete nutritioal food Colour enhancing formula enrich with catotene net weight 750gm Vegetalbe oil, vitamin a, c, e and minerals and trace elements Feed 3 to 4 times daily but in small quantity Floating type small size fish food', '1630828356_71L50xAw6bL._SL1500_.jpg', 'turtle'),
(89, 6, 4, 'Zilla Reptile Munchies For Pets', 706, 'Nutritious, Dehydrated Ingredients That Are Quick And Convenient - No Refrigeration Required! With Calcium\r\nCalcium Is Essential To Reptiles For The Prevention Of Metabolic Bone Disease\r\nEasy To Prepare - Just Rehydrate In Water\r\nProvides Nutritious Variety From Natural Ingredients In A Convenient, Resealable Package', '1630828595_81J1CyQrfZL._AC_SL1500_.jpg', 'reptile'),
(91, 7, 4, 'Hamster Chew Toys Set Small Animal Molar', 800, '?Durable Molar Tools?:iBoBoy hamster chew toys are made of apple branch and crude wood which are eco-friendly and bite-resistant.As molar tools for your pets,helping them grind the growing teeth and prevent they from chewing the cage and other furniture! Good toys to play and molar,keep your lovely pets healthy and active.', '1630829226_81h+sA0sIBS._AC_SL1500_.jpg', 'hamster'),
(92, 1, 6, 'Tractive LTE GPS Dog Tracker', 449, 'LIVE TRACKING & LOCATION HISTORY ', '1631264227_61-DKBYnACS._AC_SL1100_.jpg', 'dog'),
(93, 2, 4, ' Upgraded Automatic Cat Feeder KATALIC Stainless', 709, 'Clog-free 4L Food Tank: Consistently smoothly feed your pet with a scheduled feeding for 2-3 weeks. At the same time pet feeder keeps food fresh and delicious for every meal. Suitable for business trips, holidays and early mornings', '1631268141_71iJ83ixtnL._AC_SL1500_.jpg', 'cat');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'admin', 'admin', 'admin@gmail.com', 'admin', '9448121558', '123456789', 'sdcjns,djc'),
(26, 'Ryan', 'Rodricks', 'rodricksryan10@gmail.com', 'password101010', '8169604316', 'chembur', 'mumbai'),
(27, 'chinmay', 'k', 'chinmay@gmail.com', '1234', '9703225753', 'mumbai', 'chembur'),
(28, 'rohan', 'mane', 'rohanmane@gmail.com', '1234567890', '9865473863', 'chembur', 'mumbai');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(26, 'Ryan', 'Rodricks', 'rodricksryan10@gmail.com', 'password101010', '8169604316', 'chembur', 'mumbai'),
(27, 'chinmay', 'k', 'chinmay@gmail.com', '123', '9703225753', 'mumbai', 'chembur'),
(28, 'rohan', 'mane', 'rohanmane@gmail.com', '1234567890', '9865473863', 'chembur', 'mumbai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
