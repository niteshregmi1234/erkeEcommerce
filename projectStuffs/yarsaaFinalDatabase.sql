/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE IF NOT EXISTS `yamsaaE` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `yamsaaE`;

CREATE TABLE IF NOT EXISTS `about_us` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `about_us1image` varchar(255) NOT NULL,
  `about_us2image` varchar(255) NOT NULL,
  `about_us3image` varchar(255) NOT NULL,
  `about_us4image` varchar(255) NOT NULL,
  `about_us_description` varchar(255) NOT NULL,
  `background_image` varchar(255) NOT NULL,
  `cover_image` varchar(255) NOT NULL,
  `quote` varchar(255) NOT NULL,
  `quote_left_image` varchar(255) NOT NULL,
  `quote_right_image` varchar(255) NOT NULL,
  `special_product1_id` bigint(20) NOT NULL,
  `special_product2_id` bigint(20) NOT NULL,
  `special_product_sub_category_id` bigint(20) NOT NULL,
  `special_product_sub_category_image` varchar(255) NOT NULL,
  `video_description` varchar(255) NOT NULL,
  `video_descrption_image` varchar(255) NOT NULL,
  `video_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6of33vude0ec6ul9d39wybnsk` (`special_product1_id`),
  KEY `FK_w13v0qjdt2xyygsby60nl2l9` (`special_product2_id`),
  KEY `FK_46jovbjtu60mm99rheohxygs3` (`special_product_sub_category_id`),
  CONSTRAINT `FK_46jovbjtu60mm99rheohxygs3` FOREIGN KEY (`special_product_sub_category_id`) REFERENCES `product_sub_category` (`id`),
  CONSTRAINT `FK_6of33vude0ec6ul9d39wybnsk` FOREIGN KEY (`special_product1_id`) REFERENCES `product_details` (`id`),
  CONSTRAINT `FK_w13v0qjdt2xyygsby60nl2l9` FOREIGN KEY (`special_product2_id`) REFERENCES `product_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DELETE FROM `about_us`;
/*!40000 ALTER TABLE `about_us` DISABLE KEYS */;
INSERT INTO `about_us` (`id`, `version`, `about_us1image`, `about_us2image`, `about_us3image`, `about_us4image`, `about_us_description`, `background_image`, `cover_image`, `quote`, `quote_left_image`, `quote_right_image`, `special_product1_id`, `special_product2_id`, `special_product_sub_category_id`, `special_product_sub_category_image`, `video_description`, `video_descrption_image`, `video_name`) VALUES
	(1, 23, '9b2914f0e43fbe9374712da9a10d6f7ee78d73b7(14).jpg', '9b2914f0e43fbe9374712da9a10d6f7ee78d73b7(15).jpg', '9b2914f0e43fbe9374712da9a10d6f7ee78d73b7(16).jpg', '9b2914f0e43fbe9374712da9a10d6f7ee78d73b7(17).jpg', '1', 'countdown.jpg', '0546 hemanta.jpg', '1', 'product-12.jpg', 'acc-15-back.jpg', 12, 13, 7, 'shoes.jpg', '1', '9b2914f0e43fbe9374712da9a10d6f7ee78d73b7(20).jpg', 'MFQHd4EtilA');
/*!40000 ALTER TABLE `about_us` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `admin_user_information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f3xv5c3k9rxdo42m3avysx0ae` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DELETE FROM `admin_user_information`;
/*!40000 ALTER TABLE `admin_user_information` DISABLE KEYS */;
INSERT INTO `admin_user_information` (`id`, `version`, `email`, `first_name`, `last_name`, `password`) VALUES
	(2, 0, 'rockingguyheman.hg@gmail.com', 'hemanta', 'ghimire', '1000:3238a1d796ddd125c32198baa44b69e4:54a3ff1adc1baf3c4b9b6fc40d740f2ebd03a5352f7fe1e6c4e8bc842d5bed5df4ff7dd50241622b4355fb5e07d16b30dc113e71da4e6a01bf5555109f16111c'),
	(3, 0, 'rockingguyheman.hg1@gmail.com', 'hemanta', 'ghimire', '1000:839e63a70e7392b1cd2f15b6cb331cae:a6a79497982a845013b08efcad672de0d3d18c3a902cc6c74a542a3019f01d8c1718cb0160b81752fe2ef87ccb29a64962861b94bf1f6b2bbd9000fd5ac6c780');
/*!40000 ALTER TABLE `admin_user_information` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `background_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

DELETE FROM `background_image`;
/*!40000 ALTER TABLE `background_image` DISABLE KEYS */;
INSERT INTO `background_image` (`id`, `version`, `image_name`, `image_type`) VALUES
	(2, 2, 'newsletter.jpg', 'homeBackground');
/*!40000 ALTER TABLE `background_image` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `end_user_information_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_size_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gfl0e7hyiw2hql3svnhw5vcwj` (`end_user_information_id`),
  KEY `FK_ey2t23ju6wbpsypqcd6rnm0go` (`product_id`),
  KEY `FK_41hxtgghp53wn236m0tj6nr97` (`product_size_id`),
  CONSTRAINT `FK_41hxtgghp53wn236m0tj6nr97` FOREIGN KEY (`product_size_id`) REFERENCES `product_size` (`id`),
  CONSTRAINT `FK_ey2t23ju6wbpsypqcd6rnm0go` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_gfl0e7hyiw2hql3svnhw5vcwj` FOREIGN KEY (`end_user_information_id`) REFERENCES `end_user_information` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `check_out` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DELETE FROM `check_out`;
/*!40000 ALTER TABLE `check_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_out` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `check_out_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `delivery_method_id` bigint(20) NOT NULL,
  `payment_method_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t0j7sjyoa92ruqr80wimwuemm` (`delivery_method_id`),
  KEY `FK_7nt2ghxhktixf5ed3u9pffftl` (`payment_method_id`),
  CONSTRAINT `FK_7nt2ghxhktixf5ed3u9pffftl` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FK_t0j7sjyoa92ruqr80wimwuemm` FOREIGN KEY (`delivery_method_id`) REFERENCES `delivery_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DELETE FROM `check_out_detail`;
/*!40000 ALTER TABLE `check_out_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_out_detail` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `company_information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `logo_image_name` varchar(255) NOT NULL,
  `mobilenumber` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `proprietor_name` varchar(255) NOT NULL,
  `cover_image_name` varchar(255) NOT NULL,
  `description_where_we_are` varchar(255) NOT NULL,
  `location1` varchar(255) NOT NULL,
  `location2` varchar(255) NOT NULL,
  `location3` varchar(255) NOT NULL,
  `location4` varchar(255) NOT NULL,
  `shop_inside_view_image_name` varchar(255) NOT NULL,
  `map_image_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DELETE FROM `company_information`;
/*!40000 ALTER TABLE `company_information` DISABLE KEYS */;
INSERT INTO `company_information` (`id`, `version`, `company_name`, `email_address`, `logo_image_name`, `mobilenumber`, `phone_number`, `proprietor_name`, `cover_image_name`, `description_where_we_are`, `location1`, `location2`, `location3`, `location4`, `shop_inside_view_image_name`, `map_image_name`) VALUES
	(1, 18, 'sdas', 'rockingguyheman.hg@gmail.com', 'img04.jpg', 'a', 'dsaas', 's', 'slider1(1).jpg', 'nn  n', 's', 's', 's', 's', 'blog2(1).jpg', 'sadsadsa');
/*!40000 ALTER TABLE `company_information` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `cover_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `status_show` bit(1) NOT NULL,
  `slide_place` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

DELETE FROM `cover_image`;
/*!40000 ALTER TABLE `cover_image` DISABLE KEYS */;
INSERT INTO `cover_image` (`id`, `version`, `image_name`, `status_show`, `slide_place`) VALUES
	(15, 3, 'slider4.jpg', b'1', 'UP'),
	(16, 2, 'getinspired1.jpg', b'1', 'DOWN'),
	(17, 1, 'getinspired2.jpg', b'1', 'DOWN');
/*!40000 ALTER TABLE `cover_image` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `delivery_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `brief_describe` varchar(255) NOT NULL,
  `detail_describe` varchar(255) NOT NULL,
  `is_show_status` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

DELETE FROM `delivery_method`;
/*!40000 ALTER TABLE `delivery_method` DISABLE KEYS */;
INSERT INTO `delivery_method` (`id`, `version`, `brief_describe`, `detail_describe`, `is_show_status`) VALUES
	(1, 0, 'Day', 'One day Delivery', b'1'),
	(2, 0, 'Weekly', 'one week', b'1'),
	(4, 0, 'vvvvv', 'vhvhvhvhvh', b'1');
/*!40000 ALTER TABLE `delivery_method` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `end_user_information` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_njhpb0ld714vus7ok4fxrhdes` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

DELETE FROM `end_user_information`;
/*!40000 ALTER TABLE `end_user_information` DISABLE KEYS */;
INSERT INTO `end_user_information` (`id`, `version`, `address`, `city`, `email`, `first_name`, `last_name`, `password`, `phone`) VALUES
	(1, 0, 'nkknnnnnnn', 'njnjnjnjjnjjn', 'rockingguyheman.hg@gmail.com', 'bhbhbhbhbhb', 'bbhbbhhbhbhb', '1000:23037ee7a336781e63e34becc505507d:093aa2fa3a9ab87846fd2e89d2171c1eef2d2c1f55426106c37ceef88b44b8efcbd88c5dacf8dde7dfb82bdd8e88d1a6a55380979ebd4ecd0ae011b05479f872', '9817152705'),
	(2, 0, 'kathmandu', 'kathmandu', 'bonishthapa@gmail.com', 'bonish', 'thapa', '1000:642a5447145daab67cdc9b9fa62c9273:201c5d9a915068524fb2a42d48443e71be1e7cfd7102073d83606bc4002f5b68f14097ff8c1af484123480b458005e0f0173df67cac9ee11f3d38c13689e6f61', '9849682358'),
	(3, 0, 'hhbhbbbhbh', 'hbbhbhhbhbhb', 'rockingguyheman.hg1@gmail.com', 'hbhbhhbhbhb', 'bhbhhbhbhbhb', '1000:d4b44cb0aa4bd95a3b2941b0232d88c1:8ab7599738c7846a67c327c4d0829b14dc9df22ac4e14a7ab330e14bafde0c212af6f892dbba4dc63b208d3bc9f003f00d5dfe9cc570bce8f850c68712bbec31', '9817152705'),
	(4, 0, 'hbhhhvhvhvhv', 'hbjjjbbjbj', 'nishant@gmail.com', 'hvvvhvvvv', 'hvhvhvhhhhv', '1000:cd79c4b1a59e97148d9823f9ab378d9f:ae242bbf0c3f145f2802554d255aece6e205a39f58a0cd0ee36dda10ea821321ddea140570d58d9f2ad9cf6a774ba4527b1793d69c18705a8cec45cddc21faf9', '9817152705'),
	(5, 0, 'hhhhhhghg', 'hhghghghghghg', 'rockingguyheman.hg12345678@gmail.com', 'ggggvvvg', 'vggvvggvgvgv', '1000:b096cebac7f30cb1e5aca297e59e066b:8034726cd11ec7db8d436670f475b816f1971374425f8602d2930facf92aa59ab5a072255d3d84f9908dec7635f16b4b5acaf2499fbab6a71136eadc2e0115b3', '9817152705'),
	(6, 0, 'hhghgghghhghg', 'hghghghghgh', 'xenongrg@gmail.com', 'hhhh', 'hhhhhh', '1000:d4ba96c5459a399aa821765cbe5e992b:c990ec739847cd34ce97ee8892776117f7853bac72915163878b5969de5a85c49a72ec6e005e7c8fed617bbdba64414913b5ae183dc9b8abeb492a2af695df6a', '9817152705'),
	(7, 0, 'njnnjnjnjn', 'njjnjnnjnjn', 'rockingguy_hemanta@yahoo.com', 'jj j jj j jj', 'jkknknnknk', '1000:d1c18416ad69a532aa00212a91b22dad:2703c0bea18ea3d303e555daf2cd9a0404c39edc6a4d4c9c064cba7dff697d81fe18045622f53306f744e279264abed6cb720153218a222a9ef8920d9c7ad424', '9817152705'),
	(8, 0, 'jjnjnjnjnjn', 'njjnjnjnnjnjn', 'rockingguyheman.hg231@gmail.com', 'bhhbhbhb', 'bhhbbhhbhbhb', '1000:299bae2b3d0d99d2f1cefef2ae63f729:ec2ee575bbaac6df522cf9c0fa426f6b77f26b256924f961c522947f1b07f6bb3d3a310dd0f09dd4290f2e414e5b135fe5e99bbb757a88f8b5e2516e6164f899', '9817152705'),
	(9, 0, 'bbhhbbhhbhb', 'bhhbhbbhbhhbhb', 'rockingguyheman.hg12@gmail.com', 'bhhbhbbhhb', 'bhhbbhbbhhb', '1000:37a380e86696a89e994c1c3c7b099713:4b940c5415315ed5343693022c1929ae11c4dac58ca48a2269f8f73d06bcd3e86fd8852f08265e394f6125354af578127b4c017cd152f0fdef32f3abc132f8cc', '9817152705');
/*!40000 ALTER TABLE `end_user_information` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `home_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `box1description` varchar(255) NOT NULL,
  `box1title` varchar(255) NOT NULL,
  `box2description` varchar(255) NOT NULL,
  `box2title` varchar(255) NOT NULL,
  `box3description` varchar(255) NOT NULL,
  `box3title` varchar(255) NOT NULL,
  `cover_down_image_description` varchar(255) NOT NULL,
  `cover_down_image_title` varchar(255) NOT NULL,
  `special_brand_image_description_down` varchar(255) NOT NULL,
  `special_brand_image_description_up` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DELETE FROM `home_content`;
/*!40000 ALTER TABLE `home_content` DISABLE KEYS */;
INSERT INTO `home_content` (`id`, `version`, `box1description`, `box1title`, `box2description`, `box2title`, `box3description`, `box3title`, `cover_down_image_description`, `cover_down_image_title`, `special_brand_image_description_down`, `special_brand_image_description_up`) VALUES
	(1, 0, 'nn', 'nnn', 'nnn', 'nnn', 'nnnn', 'nnnn', 'nnnn', 'nnnn', 'nnnn', 'nnnnn');
/*!40000 ALTER TABLE `home_content` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `other_costs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `shipping_and_handling_percentage` int(11) NOT NULL,
  `tax_percentage` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DELETE FROM `other_costs`;
/*!40000 ALTER TABLE `other_costs` DISABLE KEYS */;
INSERT INTO `other_costs` (`id`, `version`, `shipping_and_handling_percentage`, `tax_percentage`) VALUES
	(1, 0, 2, 2);
/*!40000 ALTER TABLE `other_costs` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `brief_describe` varchar(255) NOT NULL,
  `detail_describe` varchar(255) NOT NULL,
  `is_show_status` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DELETE FROM `payment_method`;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` (`id`, `version`, `brief_describe`, `detail_describe`, `is_show_status`) VALUES
	(1, 0, 'E-sewa', 'It will be very easy for you to do so', b'1'),
	(2, 0, 'Delivery Payment', 'You can', b'1'),
	(3, 1, 'dasdsadas', 'asdadadassssssssssss', b'1');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `back_image_name` varchar(255) NOT NULL,
  `front_image_name` varchar(255) NOT NULL,
  `is_featured` bit(1) NOT NULL,
  `is_latest` bit(1) NOT NULL,
  `product_color_id` bigint(20) NOT NULL,
  `product_details_id` bigint(20) NOT NULL,
  `seasons_id` bigint(20) NOT NULL,
  `side_image_name` varchar(255) NOT NULL,
  `product_specification_name` varchar(255) NOT NULL,
  `special_image_name` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3j471hra3ef8k4njw0s7wcwd7` (`product_color_id`),
  KEY `FK_6ye6y7j2el91y9duxdujvlwtl` (`product_details_id`),
  KEY `FK_jhfcggs2k9ji10fu3e5supve4` (`seasons_id`),
  CONSTRAINT `FK_3j471hra3ef8k4njw0s7wcwd7` FOREIGN KEY (`product_color_id`) REFERENCES `product_color` (`id`),
  CONSTRAINT `FK_6ye6y7j2el91y9duxdujvlwtl` FOREIGN KEY (`product_details_id`) REFERENCES `product_details` (`id`),
  CONSTRAINT `FK_jhfcggs2k9ji10fu3e5supve4` FOREIGN KEY (`seasons_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `version`, `back_image_name`, `front_image_name`, `is_featured`, `is_latest`, `product_color_id`, `product_details_id`, `seasons_id`, `side_image_name`, `product_specification_name`, `special_image_name`, `product_id`) VALUES
	(12, 6, 'detailbig2.jpg', 'detailbig1.jpg', b'1', b'1', 5, 9, 2, 'detailbig3.jpg', 'cool-shirt-blue', 'product1_2.jpg', 'dsadsad'),
	(13, 3, '(2)', 'accessory-2.jpg', b'1', b'1', 6, 9, 2, '(2)', 'cool-shirt-black', 'accessory-2(1).jpg', 'dacccdc'),
	(14, 0, '19727377_1110364892396792_899130977_o.jpg', '19727377_1110364892396792_899130977_o.jpg', b'1', b'1', 5, 10, 2, '19727377_1110364892396792_899130977_o.jpg', 'dynamic shoe-blue', '19727377_1110364892396792_899130977_o.jpg', 'bbagbxga'),
	(15, 0, 'detailsquare2.jpg', 'blog-avatar2.jpg', b'1', b'1', 5, 9, 2, 'blog-avatar2.jpg', 'cool-shirt-blue', 'getinspired1.jpg', 'hdshabdhba'),
	(16, 0, '19727377_1110364892396792_899130977_o(2).jpg', '19807404_1110365882396693_732275224_o.jpg', b'1', b'1', 6, 10, 2, '19727377_1110364892396792_899130977_o(1).jpg', 'dynamic shoe-black', '19727377_1110364892396792_899130977_o(3).jpg', 'wqeqwewqewq'),
	(17, 0, '19830256_1110366139063334_1874549821_o.jpg', '19830131_1110365759063372_710144821_o.jpg', b'1', b'1', 5, 11, 2, '19850760_1110365339063414_1387750749_o.jpg', 'nnjjjnjnjnjn-blue', '19850823_1110364072396874_1780654311_o.jpg', 'kkkkknkknnk'),
	(18, 0, '19830070_1110366282396653_145230799_o.jpg', '19820978_1110363855730229_810044349_o.jpg', b'1', b'1', 6, 11, 2, '19850760_1110365339063414_1387750749_o(1).jpg', 'nnjjjnjnjnjn-black', '19850823_1110364072396874_1780654311_o(1).jpg', 'nncnscsdsd'),
	(19, 0, 'product2_2.jpg', 'blog-avatar2(1).jpg', b'1', b'1', 6, 13, 2, 'getinspired1(1).jpg', 'bhhvvhvhvh-black', 'detailbig3(1).jpg', '8102a60e-748b-469a-a8c5-8f47639e6909');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `product_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `status_show` bit(1) NOT NULL,
  `brand_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

DELETE FROM `product_brand`;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` (`id`, `version`, `brand_name`, `status_show`, `brand_description`) VALUES
	(1, 2, 'Italian', b'1', 'dsadsadsadasas'),
	(2, 0, 'asdadsa', b'1', '');
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status_show` bit(1) NOT NULL,
  `cover_image_name` varchar(255) NOT NULL,
  `menu_image1` varchar(255) NOT NULL,
  `menu_image2` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

DELETE FROM `product_category`;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` (`id`, `version`, `category_name`, `status_show`, `cover_image_name`, `menu_image1`, `menu_image2`, `category_id`, `category_description`) VALUES
	(18, 1, 'MEN', b'1', 'mens-banner.jpg', 'men-nav-1.jpg', 'men-nav-2.jpg', 'aaaaa', 'dadadasdsadas'),
	(19, 0, 'WOMEN', b'1', 'womens-banner.jpg', 'women-nav-1.jpg', 'women-nav-2.jpg', 'bbbbb', '');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `product_color` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `color_name` varchar(255) NOT NULL,
  `status_show` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

DELETE FROM `product_color`;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
INSERT INTO `product_color` (`id`, `version`, `color_name`, `status_show`) VALUES
	(5, 0, 'blue', b'1'),
	(6, 0, 'black', b'1');
/*!40000 ALTER TABLE `product_color` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `product_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `brief_description` varchar(255) NOT NULL,
  `detail_description` varchar(255) NOT NULL,
  `discount_percentage` float NOT NULL,
  `is_sale` bit(1) NOT NULL,
  `price` float NOT NULL,
  `product_brand_id` bigint(20) NOT NULL,
  `product_category_id` bigint(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_sub_category_id` bigint(20) NOT NULL,
  `product_sizes` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5qfryfjg4ybmn2c3dpvtufdmm` (`product_brand_id`),
  KEY `FK_3wrr9j35vf8podid3wn4ocuj` (`product_category_id`),
  KEY `FK_c3o9e9wf5owfguuvsbagdydxq` (`product_sub_category_id`),
  CONSTRAINT `FK_3wrr9j35vf8podid3wn4ocuj` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `FK_5qfryfjg4ybmn2c3dpvtufdmm` FOREIGN KEY (`product_brand_id`) REFERENCES `product_brand` (`id`),
  CONSTRAINT `FK_c3o9e9wf5owfguuvsbagdydxq` FOREIGN KEY (`product_sub_category_id`) REFERENCES `product_sub_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

DELETE FROM `product_details`;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` (`id`, `version`, `brief_description`, `detail_description`, `discount_percentage`, `is_sale`, `price`, `product_brand_id`, `product_category_id`, `product_name`, `product_sub_category_id`, `product_sizes`) VALUES
	(9, 18, 'sdasdasdas', 'aasdasdas', 12, b'1', 1000, 1, 18, 'cool-shirt', 5, '2,3,4,'),
	(10, 2, 'dsfsdf', 'dadadas', 12, b'1', 12300, 1, 18, 'dynamic shoe', 7, '2,3'),
	(11, 1, 'bhhhbhbhbhbbh', 'bhbhhbhbhbhbhb', 2, b'1', 10000, 1, 18, 'nnjjjnjnjnjn', 5, '2,3'),
	(12, 1, 'jjnnjjnnj', 'njnnjnjnjnj', 12, b'1', 12, 1, 19, 'bhbhbhbhbh', 5, '2,3'),
	(13, 1, 'gfgffggfgf', 'fgfggfgfgfgf', 23, b'1', 23, 1, 19, 'bhhvvhvhvh', 6, '2,3');
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `product_size` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `size_name` varchar(255) NOT NULL,
  `status_show` bit(1) NOT NULL,
  `size_details` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

DELETE FROM `product_size`;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` (`id`, `version`, `size_name`, `status_show`, `size_details`) VALUES
	(2, 0, 'xxl', b'1', 'vbvbbvvb'),
	(3, 0, 'xl', b'1', 'vcccvcvcv'),
	(4, 0, 'xxxl', b'1', 'dasdsadas'),
	(5, 0, '87', b'1', 'vcvccvcvcv');
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `product_sub_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `status_show` bit(1) NOT NULL,
  `sub_category_name` varchar(255) NOT NULL,
  `cover_image_name` varchar(255) NOT NULL,
  `product_sub_category_specify_id` bigint(20) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `sub_category_id` varchar(255) NOT NULL,
  `sub_category_description` varchar(255) NOT NULL,
  `is_footer` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pw8ymy9h8x2o02lk2100w9eh0` (`product_sub_category_specify_id`),
  CONSTRAINT `FK_pw8ymy9h8x2o02lk2100w9eh0` FOREIGN KEY (`product_sub_category_specify_id`) REFERENCES `product_sub_category_specify` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

DELETE FROM `product_sub_category`;
/*!40000 ALTER TABLE `product_sub_category` DISABLE KEYS */;
INSERT INTO `product_sub_category` (`id`, `version`, `status_show`, `sub_category_name`, `cover_image_name`, `product_sub_category_specify_id`, `product_id`, `sub_category_id`, `sub_category_description`, `is_footer`) VALUES
	(5, 3, b'1', 'shirt', 'accessory-1.jpg', 1, '', 'aaaa', 'daddadasdsa', b'1'),
	(6, 0, b'1', 'pant', '', 1, '', 'bbbb', '', b'1'),
	(7, 1, b'1', 'legShoes', '', 2, '', 'cccc', '', b'1'),
	(8, 0, b'1', 'dassadas', 'blog-avatar2.jpg', 3, '', 'dddd', '', b'1'),
	(9, 0, b'1', 'fdsfsdfdsfds', '5-back.jpg', 2, '', 'eeee', '', b'0'),
	(10, 0, b'1', 'asdasdsadsa', '4-back.jpg', 1, '', 'fffff', '', b'0'),
	(11, 0, b'1', 'bgg', 'Screenshot (9).png', 1, '', 'ggggg', '', b'0'),
	(12, 0, b'1', 'dsadads', '11-front.jpg', 1, '', 'hhhh', '', b'0'),
	(13, 0, b'1', 'bbggbgb', 'Screenshot (1).png', 1, '', 'iiiii', '', b'0'),
	(14, 0, b'1', 'dasdasdsa', '04.jpg', 1, '', 'jjjjjj', '', b'0'),
	(15, 0, b'1', 'sdfdsfsdfdsf', '04.jpg', 2, '', 'kkkkk', '', b'0'),
	(16, 0, b'1', 'asdadasdsa', '02.jpg', 2, '', 'llllll', '', b'0');
/*!40000 ALTER TABLE `product_sub_category` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `product_sub_category_specify` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `specification_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DELETE FROM `product_sub_category_specify`;
/*!40000 ALTER TABLE `product_sub_category_specify` DISABLE KEYS */;
INSERT INTO `product_sub_category_specify` (`id`, `version`, `specification_name`) VALUES
	(1, 0, 'clothing'),
	(2, 0, 'shoes'),
	(3, 0, 'accessories');
/*!40000 ALTER TABLE `product_sub_category_specify` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `seasons` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `season_name` varchar(255) NOT NULL,
  `asking_for_shopping` varchar(255) NOT NULL,
  `description_of_season` varchar(255) NOT NULL,
  `greetings` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

DELETE FROM `seasons`;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` (`id`, `version`, `season_name`, `asking_for_shopping`, `description_of_season`, `greetings`, `image_name`) VALUES
	(1, 2, 'winter', 'SHop for wonderful Winter', 'sadasdasdaasddddddddddddddddddddddddddd', 'asdadaaaaaaaaaaaaaaaaa', 'winter.jpg'),
	(2, 0, 'SUMMMER', 'adasdsa', 'asdsa', '', '4-front.jpg');
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `season_management` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `seasons_id` bigint(20) NOT NULL,
  `season_status_name` varchar(50) NOT NULL,
  `pre_advertise_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2lyulj2kri24vs64x6m8qe24f` (`seasons_id`),
  CONSTRAINT `FK_2lyulj2kri24vs64x6m8qe24f` FOREIGN KEY (`seasons_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

DELETE FROM `season_management`;
/*!40000 ALTER TABLE `season_management` DISABLE KEYS */;
INSERT INTO `season_management` (`id`, `version`, `seasons_id`, `season_status_name`, `pre_advertise_description`) VALUES
	(1, 8, 1, 'Upcoming', ''),
	(2, 2, 2, 'Present', '');
/*!40000 ALTER TABLE `season_management` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `special_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `brand_main_image_name` varchar(255) NOT NULL,
  `brand_sub1image_name` varchar(255) NOT NULL,
  `brand_sub2image_name` varchar(255) NOT NULL,
  `description_main_image` varchar(255) NOT NULL,
  `description_sub1image` varchar(255) NOT NULL,
  `description_sub2image` varchar(255) NOT NULL,
  `product_brand_id` bigint(20) NOT NULL,
  `title_for_sub1image` varchar(255) NOT NULL,
  `title_for_sub2image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_45jl5lqabvhqiahnlrf7q26b7` (`product_brand_id`),
  CONSTRAINT `FK_45jl5lqabvhqiahnlrf7q26b7` FOREIGN KEY (`product_brand_id`) REFERENCES `product_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DELETE FROM `special_brand`;
/*!40000 ALTER TABLE `special_brand` DISABLE KEYS */;
INSERT INTO `special_brand` (`id`, `version`, `brand_main_image_name`, `brand_sub1image_name`, `brand_sub2image_name`, `description_main_image`, `description_sub1image`, `description_sub2image`, `product_brand_id`, `title_for_sub1image`, `title_for_sub2image`) VALUES
	(1, 14, 'style-1(1).jpg', 'style-2.jpg', 'style-3.jpg', '1', '1', '1', 1, '1', '1');
/*!40000 ALTER TABLE `special_brand` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `style` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

DELETE FROM `style`;
/*!40000 ALTER TABLE `style` DISABLE KEYS */;
INSERT INTO `style` (`id`, `version`, `name`) VALUES
	(1, 0, 'default'),
	(2, 0, 'blue'),
	(3, 0, 'green'),
	(4, 0, 'mono'),
	(5, 0, 'pink'),
	(6, 0, 'violet');
/*!40000 ALTER TABLE `style` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `style_management` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `style_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mw5s4tnx44yj20fswi7uj3vww` (`style_id`),
  CONSTRAINT `FK_mw5s4tnx44yj20fswi7uj3vww` FOREIGN KEY (`style_id`) REFERENCES `style` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

DELETE FROM `style_management`;
/*!40000 ALTER TABLE `style_management` DISABLE KEYS */;
INSERT INTO `style_management` (`id`, `version`, `style_id`) VALUES
	(1, 18, 1);
/*!40000 ALTER TABLE `style_management` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `test_id` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

DELETE FROM `test`;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`id`, `version`, `name`, `role`, `test_id`, `image_name`) VALUES
	(1, 0, 'hemanta', 'role', 'fac6d786-992d-43b2-b8af-7fe227bc82ed', ''),
	(2, 0, 'rajesh', 'hamal', '39950894-605f-4f6c-8ace-66eb60cf85bb', ''),
	(3, 0, 'sadasds', 'sadadsa', 'cc32ba3c-c264-4614-a28e-095a4733d3d0', ''),
	(4, 0, 'fdsfsdfsdf', 'fsdfsdfsdfsdf', '3902c07b-d85a-4027-ba07-c8bba4952ef8', ''),
	(5, 0, 'sadsadsadsa', 'dsadsadadsa', '18490414-a8b9-44c7-97d0-bc3297de36ac', ''),
	(6, 0, 'jjjjnnn', 'njjnjnnj', 'ba5599e8-ab73-4a19-a369-77a1da2645e2', '02.jpg'),
	(7, 0, 'jjjjnnn', 'njjnjnnj', '1bd52a50-7232-4ded-a8d9-a63899ccc5b2', '02.jpg'),
	(8, 0, 'vgvggvgv', 'gvgvgvvg', '36b223d0-cf0c-4bdb-b44f-ef9b3350e3a6', '02.jpg'),
	(9, 0, '1fff', 'ffff', '034ac51b-2795-40c6-a085-8b90b4d1ee43', '02.jpg'),
	(10, 0, 'njjnjnjn', 'njjjjnnj', 'a1ddb39b-e9e7-4c76-bc74-0da1b3fe7618', '02(1).jpg'),
	(11, 2, 'jnjnjnjn', 'jnjnjnnjj', '0e99c6ce-e4a9-4dec-90f8-8023025fa04e', '02(2).jpg'),
	(12, 0, 'jnnjnjn', 'jnjnnjjnn', '239cb77c-8756-45e6-95b5-64e40c78d2f8', 'Screenshot (9).png');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
