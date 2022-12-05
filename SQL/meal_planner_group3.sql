-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2022 at 03:31 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meal_planner_group3`
--
CREATE DATABASE IF NOT EXISTS `meal_planner_group3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `meal_planner_group3`;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221205133044', '2022-12-05 14:30:56', 106),
('DoctrineMigrations\\Version20221205133725', '2022-12-05 14:37:34', 74),
('DoctrineMigrations\\Version20221205133907', '2022-12-05 14:39:14', 56),
('DoctrineMigrations\\Version20221205134400', '2022-12-05 14:44:08', 72),
('DoctrineMigrations\\Version20221205134910', '2022-12-05 14:49:20', 262),
('DoctrineMigrations\\Version20221205135253', '2022-12-05 14:53:02', 159),
('DoctrineMigrations\\Version20221205135519', '2022-12-05 14:55:27', 121),
('DoctrineMigrations\\Version20221205140317', '2022-12-05 15:03:40', 156);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `join_recipe`
--

CREATE TABLE `join_recipe` (
  `id` int(11) NOT NULL,
  `fk_recipes_id` int(11) NOT NULL,
  `fk_ingredients_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `procedure`
--

CREATE TABLE `procedure` (
  `id` int(11) NOT NULL,
  `instructions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servings` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weekplanner_id` int(11) DEFAULT NULL,
  `fk_procedure_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weekplanner`
--

CREATE TABLE `weekplanner` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `meal_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `join_recipe`
--
ALTER TABLE `join_recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_72662C11D9C7B69` (`fk_recipes_id`),
  ADD KEY `IDX_72662C1176E2A427` (`fk_ingredients_id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `procedure`
--
ALTER TABLE `procedure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A369E2B537F9BECB` (`fk_procedure_id`),
  ADD KEY `IDX_A369E2B53E0D81FC` (`weekplanner_id`);

--
-- Indexes for table `weekplanner`
--
ALTER TABLE `weekplanner`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `join_recipe`
--
ALTER TABLE `join_recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procedure`
--
ALTER TABLE `procedure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weekplanner`
--
ALTER TABLE `weekplanner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `join_recipe`
--
ALTER TABLE `join_recipe`
  ADD CONSTRAINT `FK_72662C1176E2A427` FOREIGN KEY (`fk_ingredients_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `FK_72662C11D9C7B69` FOREIGN KEY (`fk_recipes_id`) REFERENCES `recipes` (`id`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `FK_A369E2B537F9BECB` FOREIGN KEY (`fk_procedure_id`) REFERENCES `procedure` (`id`),
  ADD CONSTRAINT `FK_A369E2B53E0D81FC` FOREIGN KEY (`weekplanner_id`) REFERENCES `weekplanner` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
