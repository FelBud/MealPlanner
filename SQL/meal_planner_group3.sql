-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 07. Dez 2022 um 15:27
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `meal_planner_group3`
--
CREATE DATABASE IF NOT EXISTS `meal_planner_group3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `meal_planner_group3`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
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
-- Tabellenstruktur für Tabelle `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`) VALUES
(1, 'Bread crumps'),
(2, 'Egg'),
(3, 'Salt'),
(4, 'Tomato'),
(5, 'Onion'),
(6, 'Meat'),
(7, 'Ketchup'),
(8, 'Chicken breast'),
(9, 'Oil'),
(10, 'Butter');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `join_recipe`
--

CREATE TABLE `join_recipe` (
  `id` int(11) NOT NULL,
  `fk_recipes_id` int(11) NOT NULL,
  `fk_ingredients_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messenger_messages`
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
-- Tabellenstruktur für Tabelle `procedure`
--

CREATE TABLE `procedure` (
  `id` int(11) NOT NULL,
  `instructions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `procedure`
--

INSERT INTO `procedure` (`id`, `instructions`, `time`) VALUES
(1, 'How to make it:\r\nStep 1:\r\n\r\nLay out the cutlets, remove any skin and pound until thin. Season on both sides with salt and pepper. Place flour and breadcrumbs into separate flat plates, beat the eggs together on a further plate using a fork.\r\nCoat each schnitzel on both sides in flour, then draw through the beaten eggs, ensuring that no part of the schnitzel remains dry. Lastly, coat in the breadcrumbs and carefully press down the crumbs using the reverse side of the fork (this causes the crumb coating to “fluff up” better during cooking).\r\nStep 2:\r\n\r\nIn a large pan (or 2 medium-sized pans), melt sufficient clarified butter for the schnitzel to be able to swim freely in the oil (or heat up the plant oil with 1 – 2 tbsp of clarified butter or butter).\r\nOnly place the schnitzel in the pan when the fat is so hot that it hisses and bubbles up if some breadcrumbs or a small piece of butter is added to it.\r\nDepending on the thickness and the type of meat, fry for 2 to 4 minutes until golden brown. Turn using a spatula (do not pierce the coating!) and fry on the other side until it is of similar colour.\r\nStep 3:\r\n\r\nRemove the crispy schnitzel and place on kitchen paper to dry off. Dab carefully. Arrange the schnitzel on the plate and garnish with slices of lemon before serving.\r\nServe with parsley potatoes, rice, potato salad or mixed salad.\r\n\r\nCooking time: depending on the thickness and the meat: 4 – 8 minutes', NULL),
(2, ' Step 1\r\n\r\nIn a bowl, mix ground beef, egg, onion, bread crumbs, Worcestershire, garlic, 1/2 teaspoon salt, and 1/4 teaspoon pepper until well blended. Divide mixture into four equal portions and shape each into a patty about 4 inches wide.\r\nStep 2\r\n\r\nLay burgers on an oiled barbecue grill over a solid bed of hot coals or high heat on a gas grill (you can hold your hand at grill level only 2 to 3 seconds); close lid on gas grill. Cook burgers, turning once, until browned on both sides and no longer pink inside (cut to test), 7 to 8 minutes total. Remove from grill.\r\nStep 3\r\n\r\nLay buns, cut side down, on grill and cook until lightly toasted, 30 seconds to 1 minute.\r\nStep 4\r\n\r\nSpread mayonnaise and ketchup on bun bottoms. Add lettuce, tomato, burger, onion, and salt and pepper to taste. Set bun tops in place.\r\n', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `fk_procedure_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `servings` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'in progress'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `recipes`
--

INSERT INTO `recipes` (`id`, `fk_procedure_id`, `name`, `picture`, `category`, `servings`, `price`, `time`, `status`) VALUES
(1, 1, 'Test', 'index-638f409846cec.jpg', 'test', 2, '1.20', '1 sec', 'in progress');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weekplanner`
--

CREATE TABLE `weekplanner` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `meal_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `fk_recipes_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `weekplanner`
--

INSERT INTO `weekplanner` (`id`, `date`, `meal_time`, `fk_user_id`, `fk_recipes_id`) VALUES
(1, '2022-12-09', 'Breakfast', NULL, NULL),
(2, '2022-12-13', 'Lunch', NULL, NULL),
(3, '2022-12-14', 'Dinner', NULL, NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `join_recipe`
--
ALTER TABLE `join_recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_72662C11D9C7B69` (`fk_recipes_id`),
  ADD KEY `IDX_72662C1176E2A427` (`fk_ingredients_id`);

--
-- Indizes für die Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indizes für die Tabelle `procedure`
--
ALTER TABLE `procedure`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A369E2B537F9BECB` (`fk_procedure_id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indizes für die Tabelle `weekplanner`
--
ALTER TABLE `weekplanner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1818E9B15741EEB9` (`fk_user_id`),
  ADD KEY `IDX_1818E9B1D9C7B69` (`fk_recipes_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `join_recipe`
--
ALTER TABLE `join_recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `procedure`
--
ALTER TABLE `procedure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `weekplanner`
--
ALTER TABLE `weekplanner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `join_recipe`
--
ALTER TABLE `join_recipe`
  ADD CONSTRAINT `FK_72662C1176E2A427` FOREIGN KEY (`fk_ingredients_id`) REFERENCES `ingredients` (`id`),
  ADD CONSTRAINT `FK_72662C11D9C7B69` FOREIGN KEY (`fk_recipes_id`) REFERENCES `recipes` (`id`);

--
-- Constraints der Tabelle `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `FK_A369E2B537F9BECB` FOREIGN KEY (`fk_procedure_id`) REFERENCES `procedure` (`id`);

--
-- Constraints der Tabelle `weekplanner`
--
ALTER TABLE `weekplanner`
  ADD CONSTRAINT `FK_1818E9B15741EEB9` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_1818E9B1D9C7B69` FOREIGN KEY (`fk_recipes_id`) REFERENCES `recipes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;