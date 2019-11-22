-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 22, 2019 at 04:52 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projects`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertised`
--

DROP TABLE IF EXISTS `advertised`;
CREATE TABLE IF NOT EXISTS `advertised` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `address` varchar(50) NOT NULL,
  `category` varchar(20) NOT NULL,
  `likes` int(11) NOT NULL,
  `image_url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertised`
--

INSERT INTO `advertised` (`id`, `name`, `latitude`, `longitude`, `address`, `category`, `likes`, `image_url`) VALUES
(0, 'McDonalds', 43.261137, -79.888428, '50 Dundurn St S, Hamilton', 'Fries & Shakes', 28, './images/McDonalds.png'),
(1, 'Osmows Shawarma', 43.22713, -79.88295, '870 Upper James St Unit #4, Hamilton', 'Mediterranean', 51, './images/osmows.jpg'),
(2, 'Spring Grill House', 43.2087894, -79.8901925, '1441 Upper James St, Hamilton', 'Korean Barbecue', 36, './images/springgrillhouse.jpg'),
(3, 'The Keg Steakhouse', 43.2174485, -79.8935239, '1170 Upper James St, Hamilton', 'Steak House', 86, './images/thekeg.jpg'),
(4, 'Swiss Chalet', 43.22721, -79.94147, '1000 Golf Links Rd RR#1, Ancaster', 'Family restaurant', 19, './images/swisschalet.jpg'),
(5, 'Lucky Chinese Food', 43.217789, -79.918259, '919 Upper Paradise Rd, Hamilton', 'Chinese', 57, './images/luckychinese.jpg'),
(6, 'Chicago Style Pizza', 43.23209, -79.84764, '534 Upper Sherman Ave, Hamilton', 'Pizza', 67, './images/chicagopizza.jpeg'),
(7, 'Mississippi Queen Foods', 43.25247, -79.84998, '635 King St E, Hamilton', 'Southern', 44, './images/queenfoods.jpg'),
(8, 'Born & Raised', 43.26235, -79.86626, '224 James St N, Hamilton', 'Italian', 89, './images/born.jpeg'),
(9, 'Caro', 43.24275, -79.81936, '4 Ottawa St N, Hamilton', 'Italian', 66, './images/caro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
CREATE TABLE IF NOT EXISTS `favourites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `comments` text NOT NULL,
  `image_url` text NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`id`, `name`, `comments`, `image_url`, `likes`) VALUES
(11, '271 West', '<p>Love the desert </p><p>Very Good </p><p> </p>', 'https://s3-media4.fl.yelpcdn.com/bphoto/UCn2Swws6wZTXqiT_zPxmg/o.jpg', 26),
(12, 'Matter of Taste', '<p>it tastes goooooood </p><p>Awesome </p><p> </p>', 'https://s3-media3.fl.yelpcdn.com/bphoto/J3pJaaLEQQjDDJ5ukwfsyg/o.jpg', 5),
(15, 'Kinkaku Izakaya', '<p>yummy food in my tummy </p><p> </p>', 'https://s3-media3.fl.yelpcdn.com/bphoto/NoKizE7VKy16t1OUB8iD8g/o.jpg', 4),
(14, 'Rainbow Caribbean Cuisine', '<p> </p>', 'https://s3-media1.fl.yelpcdn.com/bphoto/L5a3HClE0Ecb-TR7FXKfBw/o.jpg', 4);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
