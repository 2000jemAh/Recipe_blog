-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 10, 2023 at 04:36 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipe_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(1024) NOT NULL,
  `slug` varchar(1024) NOT NULL,
  `img` varchar(225) DEFAULT NULL,
  `body` longtext NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT 2,
  `updated_by` int(11) DEFAULT 2,
  `user_id` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `title`, `slug`, `img`, `body`, `created_at`, `updated_at`, `created_by`, `updated_by`, `user_id`) VALUES
(31, 'Chicken Adobo Recipe', 'chicken-adobo-recipe', 'uploads/Chicken-Adobo-6.jpg', '<p>1. Heat oil in pan and saut&eacute; garlic and onions. Then add chicken to the pan and sear on all sides, until you have a little browning in the chicken skin. 2. Pour in vinegar, soy sauce and water. Add bay leaves, pepper and Knorr Chicken Cubes. Bring to a boil over high heat then reduce heat to simmer, but do not cover the pan. Continue to simmer for 10 mins. 3. Remove chicken pieces from sauce and fry in another pan until nicely browned. 4. Put back fried chicken pieces into sauce. Add sugar and let simmer again for another 10 minutes or until sauce has thickened. Serve warm.</p>', 1682298939, 1683244911, 2, 2, 2),
(36, 'Pork Sinigang', 'pork-sinigang', 'sinigang-na-baboy-filipino-pork-sinigang.png', '<ol>\r\n	<li>Wash tamarind pods under cold, running water to remove any grit or dirt from the skins.</li>\r\n	<li>Place in a saucepan with about 1 cup water and bring to a boil. Cook for about 4 to 5 minutes until soft, and the outer skins begin to burst</li>\r\n	<li>Using a fork, mash the tamarinds to release the pulp.</li>\r\n	<li>Place the tamarind and liquid in a fine-mesh strainer set over a bowl. Continue to mash with a fork, returning some of the liquid into the strainer once or twice to fully extract the juice.</li>\r\n	<li>Discard seeds and skins. Pour tamarind juice into the pot.</li>\r\n</ol>\r\n', 1682643996, 1683250100, 6, 2, 2),
(37, 'Chicken Adobo', 'chicken-adobo', 'uploads/adorbor.jpg', '<ol>\r\n	<li>Heat oil in pan and saut&eacute; garlic and onions. Then add chicken to the pan and sear on all sides, until you have a little browning in the chicken skin.</li>\r\n	<li>Pour in vinegar, soy sauce and water. Add bay leaves, pepper and Knorr Chicken Cubes. Bring to a boil over high heat then reduce heat to simmer, but do not cover the pan. Continue to simmer for 10 mins.</li>\r\n	<li>Remove chicken pieces from sauce and fry in another pan until nicely browned.</li>\r\n	<li>Put back fried chicken pieces into sauce. Add sugar and let simmer again for another 10 minutes or until sauce has thickened. Serve warm.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n', 1683245780, 1683250993, 6, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`, `access_token`) VALUES
(2, 'realyn', '$2y$13$jupIDw8bGAzssZz7IqCLjuSloqzTgMxxWyXm5fQ677itY/QPX5qEC', 'Ql88-DnopOPkxsN7Bqa79kUeDY6grj9C', '1tPvNq-bhELMVnDkH7HydMDcSceaucxW'),
(6, 'jeremy', '$2y$13$IieLMEIQJidN8oaLrmvLAuWnxHqeFFIB0qNUntV48pRxXj1/pEYi.', 'llbypCQJWHA1eVfajlr0YzKFrr6rBVKz', 'ttKfcE8XGBHXQSi0kTgxm3JrgEX5Ehfc');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `article_user_updated_by_fk` (`updated_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_user_created_by_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `article_user_updated_by_fk` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
