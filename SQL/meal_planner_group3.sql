-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 14. Dez 2022 um 15:36
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
(57, '1 Roma tomatoes'),
(58, '  1tbs Italian dressing'),
(59, ' 56.7 grams Whole wheat pasta'),
(60, '0.75 grams Basil'),
(61, ' 3.1 grams Parmesan cheese'),
(62, 'Cream cheese 42.5 grams'),
(63, 'Egg 1 1/2 extra large'),
(64, 'Honey 3/4 tbsp'),
(65, 'Cinnamon (ground) 3/8 tbsp'),
(66, 'Oatmeal 1 cup'),
(67, 'Cream cheese 42.5 grams'),
(68, 'Egg 1 1/2 extra large'),
(69, 'Honey 3/4 tbsp'),
(70, 'Cinnamon (ground) 3/8 tbsp'),
(71, 'Oatmeal 1 cup,'),
(72, 'Cream cheese 42.5 grams'),
(73, 'Egg 1 1/2 extra large'),
(74, 'Honey 3/4 tbsp'),
(75, 'Cinnamon (ground) 3/8 tbsp'),
(76, 'Oatmeal 1 cup'),
(77, 'Celery 2/3 stalks'),
(78, 'large Chickpeas 302 grams'),
(79, 'Pepper 2/3 dash'),
(80, 'Salt 2/3 dash'),
(81, 'Pickles 13.3 grams'),
(82, 'Mayonnaise-like dressing 2 2/3 tbsp'),
(83, 'Almond milk 67.5 grams'),
(84, 'Oats 3 tbsp'),
(85, 'Banana 3/8 medium'),
(86, 'Gluten Free All Purpose Baking Flour 1/8 cup'),
(87, 'Baking powder 9/16 tsp'),
(88, 'Salt 1/8 tsp'),
(89, 'Cinnamon 1/8 tsp'),
(90, 'Nutmeg 3/16 tsp'),
(91, 'Coconut oil 2.5 grams'),
(92, 'Lettuce 57 grams'),
(93, 'Spinach 30 grams'),
(94, 'Scallions 2 medium'),
(95, 'Avocados 1/2 fruit'),
(96, 'Salt 1/2 tsp'),
(97, 'Balsamic vinegar 1 tbsp'),
(98, 'Lettuce 57 grams'),
(99, 'Spinach 30 grams'),
(100, 'Scallions 2 medium'),
(101, 'Avocados 1/2 fruit'),
(102, 'Salt 1/2 tsp'),
(103, 'Balsamic vinegar 1 tbsp,'),
(104, 'Lettuce 57 grams'),
(105, 'Spinach 30 grams'),
(106, 'Scallions 2 medium'),
(107, 'Avocados 1/2 fruit'),
(108, 'Salt 1/2 tsp'),
(109, 'Balsamic vinegar 1 tbsp,,'),
(110, 'Lettuce 57 grams'),
(111, 'Spinach 30 grams'),
(112, 'Scallions 2 medium'),
(113, 'Avocados 1/2 fruit'),
(114, 'Salt 1/2 tsp'),
(115, 'Balsamic vinegar 1 tbsp,,,'),
(116, 'Oranges 1/2 large'),
(117, 'Peaches 1 medium'),
(118, 'Strawberries(unthawed) 149 grams'),
(119, 'Spinach 30 grams'),
(120, 'Chia seeds 1 tbsp'),
(121, 'Ice cubes 237 grams'),
(122, 'Banana 1 medium'),
(123, 'Nonfat greek yogurt 227 grams'),
(124, 'Almond milk 120 grams'),
(125, 'Spinach 60 grams'),
(126, 'Maple syrup 2 tbsp'),
(127, 'Salt 1 tsp'),
(128, 'Organic Chia Seeds 4 tbsp'),
(129, 'Granola 30.5 grams'),
(130, 'Raspberries 30.8 grams'),
(131, 'Kale 268 grams'),
(132, 'Grape Tomatoes 100 grams'),
(133, 'White beans 349 grams'),
(134, 'Sauce pesto Classico basil pesto ready-to-serve 82.7 grams'),
(135, 'Lemon juice 31.3 grams'),
(136, '3 large free-range egg yolks'),
(137, '40 g Parmesan cheese (plus extra to serve)'),
(138, '1 x 150 g piece of higher-welfare guanciale'),
(139, '200 g dried spaghetti'),
(140, '1 clove of garlic'),
(141, 'extra virgin olive oil'),
(142, '4 veal cutlets 150 – 180 g / 5 - 6 oz each (alternatively use pork or turkey)'),
(143, '2 eggs'),
(144, 'Approx. 100 g / 3/4 cup coarse-ground flour'),
(145, 'Approx. 100 g / 3/4 cup breadcrumbs'),
(146, 'Salt'),
(147, 'pepper'),
(148, 'Clarified butter and/or plant oil'),
(149, 'Slices of lemon to garnish'),
(150, 'firm tofu 350 g'),
(151, 'groundnut oil 2 teaspoons'),
(152, 'sesame seeds 120 grams'),
(153, 'cornflour ½ tablespoon'),
(154, 'soy sauce 2 tablespoons'),
(155, 'white wine vinegar 1 tablespoon'),
(156, 'garlic 1 clove'),
(157, 'fresh red chilli (plus extra to serve) 1'),
(158, 'ginger 5 cm piece'),
(159, 'asparagus 320 g'),
(160, 'beansprouts 150 g'),
(161, 'rice noodles to serve (optional)  200 g'),
(162, '1 pound ground lean (7% fat) beef'),
(163, '1 large egg'),
(164, '½ cup minced onion'),
(165, '¼ cup fine dried bread crumbs'),
(166, '1 tablespoon Worcestershire'),
(167, '1 or 2 cloves garlic (peeled and minced)'),
(168, 'About 1/2 teaspoon salt'),
(169, 'About 1/4 teaspoon pepper'),
(170, '4 hamburger buns (4 in. wide) split'),
(171, 'About 1/4 cup mayonnaise'),
(172, 'About 1/4 cup ketchup'),
(173, '4 iceberg lettuce leaves (rinsed and crisped)'),
(174, '1 firm-ripe tomato (cored and thinly sliced)'),
(175, '4 thin slices red onion'),
(176, 'Oranges 1/2 large'),
(177, 'Peaches 1 medium'),
(178, 'Strawberries(unthawed) 149 grams'),
(179, 'Spinach 30 grams'),
(180, 'Chia seeds 1 tbsp'),
(181, 'Ice cubes 237 grams,'),
(182, 'Oranges 1/2 large'),
(183, 'Peaches 1 medium'),
(184, 'Strawberries(unthawed) 149 grams'),
(185, 'Spinach 30 grams'),
(186, 'Chia seeds 1 tbsp'),
(187, 'Ice cubes 237 grams,,'),
(188, 'Oranges 1/2 large'),
(189, 'Peaches 1 medium'),
(190, 'Strawberries(unthawed) 149 grams'),
(191, 'Spinach 30 grams'),
(192, 'Chia seeds 1 tbsp'),
(193, 'Ice cubes 237 grams,,,'),
(194, '450 g spaghetti'),
(195, 'Salt ¼'),
(196, 'cup extra-virgin olive oil'),
(197, '4 garlic cloves (minced)'),
(198, '½ teaspoon crushed red pepper'),
(199, '2 dozen littleneck clams (scrubbed)'),
(200, '¼ cup water'),
(201, '¼ cup finely chopped parsley'),
(202, 'Freshly ground black pepper'),
(203, '3 large firm aubergines'),
(204, 'olive oil'),
(205, '1 onion '),
(206, '½ a bulb of spring garlic or 1 clove of regular garlic'),
(207, '1 heaped teaspoon dried oregano'),
(208, '2 x 400 g tins of quality plum tomatoes or 1kg fresh ripe tomatoes'),
(209, 'wine vinegar'),
(210, '1 bunch of fresh basil (30g)'),
(211, '3 large handfuls of Parmesan cheese (freshly grated)'),
(212, '2 handfuls of dried breadcrumbs'),
(213, 'a few sprigs of fresh oregano'),
(214, '150 g buffalo mozzarella (optional)'),
(215, 'Extra-virgin olive oil'),
(216, '275 grams day-old country/artisan bread (crusts removed) cut into ½-inch pieces'),
(217, '2 cups milk or buttermilk'),
(218, '450 g ground pork'),
(219, '450 g ground beef'),
(220, '1 medium onion (minced)'),
(221, '1/3 cup Tomato Sauce'),
(222, '2 large eggs'),
(223, '½ cup finely grated Parmigiano-Reggiano'),
(224, '3 grams (½ teaspoon) kosher salt'),
(225, '½ teaspoon freshly ground black pepper'),
(226, 'fine rice noodles 100 g'),
(227, 'tin of pineapple chunks in juice 1 x 227 g'),
(228, 'cornflour 2'),
(229, 'heaped teaspoons cider vinegar 1'),
(230, 'tablespoon low-salt soy sauce 2'),
(231, 'teaspoons sesame seeds 2'),
(232, 'teaspoons cashew nuts 30 g'),
(233, 'spring onions 4'),
(234, 'garlic 2 cloves'),
(235, 'ginger 2 cm piece'),
(236, 'fresh red chilli 1'),
(237, 'sugarsnap peas 200 g'),
(238, 'groundnut oil sprouts 200 g'),
(239, 'lime 1'),
(240, '4 rashers of higher-welfare smoked streaky bacon (optional)'),
(241, 'olive oil'),
(242, '1 clove of garlic'),
(243, '2 small onions'),
(244, '2 fresh bay leaves'),
(245, '2 carrots'),
(246, '2 sticks of celery'),
(247, '2 large handfuls of seasonal greens (such as savoy cabbage/curly kale/chard)'),
(248, '1 vegetable stock cube'),
(249, '1 x 400 g tin of quality plum tomatoes'),
(250, '2 x 400 g tins of beans (such as cannellini butter or mixed)'),
(251, '100 g dried pasta Parmesan cheese'),
(252, 'to serve extra virgin olive oil'),
(253, '3 tablespoons olive oi,l 1 large yellow onion (finely diced - about 1 1/4 cups)'),
(254, '1 celery rib (finely diced)'),
(255, '1 carrot (finely diced)'),
(256, '4 cloves garlic (minced or crushed)'),
(257, '1 teaspoon ground cumin'),
(258, '1 teaspoon dried oregano'),
(259, '2 tablespoons tatli biber salçasi (Turkish sweet pepper paste)'),
(260, '1 1/2 cups (8.8oz/250g) dried red lentils'),
(261, '2 liters (8 1/2 cups) vegetable stock'),
(262, '1 to 2 lemons (juiced - to taste)'),
(263, '1 teaspoon salt'),
(264, '1/2 teaspoon freshly ground black pepper,'),
(265, '2 x 130 g salmon fillets (skin on scaled pin-boned)'),
(266, '2 tablespoons sesame seeds'),
(267, '1 bunch of mint (30g)'),
(268, '2 large oranges extra virgin olive oil'),
(269, 'red wine vinegar'),
(270, '1 x 250 g packet of cooked mixed grains'),
(271, '2 small carrots'),
(272, '2 heaped teaspoons harissa'),
(273, 'sweet potato 1'),
(274, 'aubergine 1'),
(275, '2 mixed-colour peppers'),
(276, 'onions 2'),
(277, 'olive oil'),
(278, 'a bunch of fresh coriander'),
(279, '½ sun-dried tomatoes'),
(280, '30 g tablespoons'),
(281, 'Thai curry paste'),
(282, '2 tin of light coconut milk'),
(283, '½ x 400 g mangetout'),
(284, '160 g soy or fish sauce'),
(285, '2 teaspoons lime'),
(286, '1 flatbreads(optional) 2'),
(287, 'Extra-virgin olive oil'),
(288, '275 grams day-old country/artisan bread (crusts removed) cut into ½-inch pieces'),
(289, '2 cups milk or buttermilk'),
(290, '450 g ground pork'),
(291, '450 g ground beef'),
(292, '1 medium onion (minced)'),
(293, '1/3 cup Tomato Sauce'),
(294, '2 large eggs'),
(295, '½ cup finely grated Parmigiano-Reggiano'),
(296, '3 grams (½ teaspoon) kosher salt'),
(297, '½ teaspoon freshly ground black pepper,'),
(298, '3 large firm aubergines'),
(299, 'olive oil'),
(300, '1 onion '),
(301, '½ a bulb of spring garlic or 1 clove of regular garlic'),
(302, '1 heaped teaspoon dried oregano'),
(303, '2 x 400 g tins of quality plum tomatoes or 1kg fresh ripe tomatoes'),
(304, 'wine vinegar'),
(305, '1 bunch of fresh basil (30g)'),
(306, '3 large handfuls of Parmesan cheese (freshly grated)'),
(307, '2 handfuls of dried breadcrumbs'),
(308, 'a few sprigs of fresh oregano'),
(309, '150 g buffalo mozzarella (optional),'),
(310, '4 rashers of higher-welfare smoked streaky bacon (optional)'),
(311, 'olive oil'),
(312, '1 clove of garlic'),
(313, '2 small onions'),
(314, '2 fresh bay leaves'),
(315, '2 carrots'),
(316, '2 sticks of celery'),
(317, '2 large handfuls of seasonal greens (such as savoy cabbage/curly kale/chard)'),
(318, '1 vegetable stock cube'),
(319, '1 x 400 g tin of quality plum tomatoes'),
(320, '2 x 400 g tins of beans (such as cannellini butter or mixed)'),
(321, '100 g dried pasta Parmesan cheese'),
(322, 'to serve extra virgin olive oil,'),
(323, '450 g spaghetti'),
(324, 'Salt ¼'),
(325, 'cup extra-virgin olive oil'),
(326, '4 garlic cloves (minced)'),
(327, '½ teaspoon crushed red pepper'),
(328, '2 dozen littleneck clams (scrubbed)'),
(329, '¼ cup water'),
(330, '¼ cup finely chopped parsley'),
(331, 'Freshly ground black pepper,');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `join_recipe`
--

CREATE TABLE `join_recipe` (
  `id` int(11) NOT NULL,
  `fk_recipes_id` int(11) NOT NULL,
  `fk_ingredients_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `join_recipe`
--

INSERT INTO `join_recipe` (`id`, `fk_recipes_id`, `fk_ingredients_id`) VALUES
(39, 11, 57),
(40, 11, 58),
(41, 11, 59),
(42, 11, 60),
(43, 11, 61),
(49, 12, 67),
(50, 12, 68),
(51, 12, 69),
(52, 12, 70),
(53, 12, 71),
(54, 13, 72),
(55, 13, 73),
(56, 13, 74),
(57, 13, 75),
(58, 13, 76),
(59, 14, 77),
(60, 14, 78),
(61, 14, 79),
(62, 14, 80),
(63, 14, 81),
(64, 14, 82),
(65, 15, 83),
(66, 15, 84),
(67, 15, 85),
(68, 15, 86),
(69, 15, 87),
(70, 15, 88),
(71, 15, 89),
(72, 15, 90),
(73, 15, 91),
(92, 16, 110),
(93, 16, 111),
(94, 16, 112),
(95, 16, 113),
(96, 16, 114),
(97, 16, 115),
(104, 18, 122),
(105, 18, 123),
(106, 18, 124),
(107, 18, 125),
(108, 18, 126),
(109, 18, 127),
(110, 18, 128),
(111, 18, 129),
(112, 18, 130),
(113, 19, 131),
(114, 19, 132),
(115, 19, 133),
(116, 19, 134),
(117, 19, 135),
(118, 20, 136),
(119, 20, 137),
(120, 20, 138),
(121, 20, 139),
(122, 20, 140),
(123, 20, 141),
(124, 21, 142),
(125, 21, 143),
(126, 21, 144),
(127, 21, 145),
(128, 21, 146),
(129, 21, 147),
(130, 21, 148),
(131, 21, 149),
(132, 22, 150),
(133, 22, 151),
(134, 22, 152),
(135, 22, 153),
(136, 22, 154),
(137, 22, 155),
(138, 22, 156),
(139, 22, 157),
(140, 22, 158),
(141, 22, 159),
(142, 22, 160),
(143, 22, 161),
(144, 23, 162),
(145, 23, 163),
(146, 23, 164),
(147, 23, 165),
(148, 23, 166),
(149, 23, 167),
(150, 23, 168),
(151, 23, 169),
(152, 23, 170),
(153, 23, 171),
(154, 23, 172),
(155, 23, 173),
(156, 23, 174),
(157, 23, 175),
(170, 17, 188),
(171, 17, 189),
(172, 17, 190),
(173, 17, 191),
(174, 17, 192),
(175, 17, 193),
(208, 27, 226),
(209, 27, 227),
(210, 27, 228),
(211, 27, 229),
(212, 27, 230),
(213, 27, 231),
(214, 27, 232),
(215, 27, 233),
(216, 27, 234),
(217, 27, 235),
(218, 27, 236),
(219, 27, 237),
(220, 27, 238),
(221, 27, 239),
(235, 29, 253),
(236, 29, 254),
(237, 29, 255),
(238, 29, 256),
(239, 29, 257),
(240, 29, 258),
(241, 29, 259),
(242, 29, 260),
(243, 29, 261),
(244, 29, 262),
(245, 29, 263),
(246, 29, 264),
(247, 30, 265),
(248, 30, 266),
(249, 30, 267),
(250, 30, 268),
(251, 30, 269),
(252, 30, 270),
(253, 30, 271),
(254, 30, 272),
(255, 31, 273),
(256, 31, 274),
(257, 31, 275),
(258, 31, 276),
(259, 31, 277),
(260, 31, 278),
(261, 31, 279),
(262, 31, 280),
(263, 31, 281),
(264, 31, 282),
(265, 31, 283),
(266, 31, 284),
(267, 31, 285),
(268, 31, 286),
(269, 26, 287),
(270, 26, 288),
(271, 26, 289),
(272, 26, 290),
(273, 26, 291),
(274, 26, 292),
(275, 26, 293),
(276, 26, 294),
(277, 26, 295),
(278, 26, 296),
(279, 26, 297),
(280, 25, 298),
(281, 25, 299),
(282, 25, 300),
(283, 25, 301),
(284, 25, 302),
(285, 25, 303),
(286, 25, 304),
(287, 25, 305),
(288, 25, 306),
(289, 25, 307),
(290, 25, 308),
(291, 25, 309),
(292, 28, 310),
(293, 28, 311),
(294, 28, 312),
(295, 28, 313),
(296, 28, 314),
(297, 28, 315),
(298, 28, 316),
(299, 28, 317),
(300, 28, 318),
(301, 28, 319),
(302, 28, 320),
(303, 28, 321),
(304, 28, 322),
(305, 24, 323),
(306, 24, 324),
(307, 24, 325),
(308, 24, 326),
(309, 24, 327),
(310, 24, 328),
(311, 24, 329),
(312, 24, 330),
(313, 24, 331);

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
(12, 'Step 1:\r\n\r\nFinely chop basil and dice tomatoes.\r\nStep 2:\r\n\r\nBring a large pot of lightly salted water to a boil. Place the penne pasta in the pot, cook 10 minutes, until al dente, and drain.\r\nStep 3:\r\n\r\nIn a large bowl, toss the cooked pasta with the tomatoes, Italian dressing, basil, and Parmesan cheese.', NULL),
(13, 'Step 1:\r\n\r\nBlend ingredients or hand-whisk vigorosly\r\nStep 2:\r\n\r\nheat butter or cooking oil in small skillet and then pour out a a single pancake\r\nStep 3:\r\n\r\nOnce small bubbles appear all over the surface, flip the pancake\r\nStep 4:\r\n\r\nRepeat steps 2 and 3 for each pancake, serve immediately\r\nStep 5:\r\n\r\nOptional: use french-toast toppings to create all kinds of combinations, also pairs well with fruit.', NULL),
(14, 'Step 1\r\nBlend ingredients or hand-whisk vigorosly\r\n\r\nStep 2:\r\nheat butter or cooking oil in small skillet and then pour out a a single pancake\r\n\r\nStep 3:\r\nOnce small bubbles appear all over the surface, flip the pancake\r\n\r\nStep 4:\r\nRepeat steps 2 and 3 for each pancake, serve immediately\r\n\r\nStep 5:\r\nOptional: use french-toast toppings to create all kinds of combinations, also pairs well with fruit.', NULL),
(15, 'Step 1:\r\nChop the celery.\r\n\r\nStep 2:\r\nDrain the chickpeas and place in a bowl. Mash with a potato masher (or large fork).\r\n\r\nStep 3:\r\nAdd all of the remaining ingredients and mix together well.\r\n\r\nStep 4:\r\nServe as desired and enjoy!', NULL),
(16, 'Step 1:\r\nBlend almond milk and oats.\r\n\r\nStep 2:\r\nAdd all other ingredients (excluding coconut oil) and continue to blend.\r\n\r\nStep 3:\r\nLet mix rest for 10 mins.\r\n\r\nStep 4:\r\nHeat coconunt oil in a non-stick pan over medium heat.\r\n\r\nStep 5:\r\nIn 1/4 cup portions, cook pancakes approximately 3-5 minutes per side. Serve immediately and enjoy!', NULL),
(17, 'Step 1\r\nChop all ingredients. Mix in a bowl. \r\nSeason with salt and vinegar. Toss once more and enjoy!', NULL),
(18, 'Step 1:\r\nJuice 1/2 an orange and chop peach.\r\n\r\nStep 2:\r\nPlace all ingredients in a blender and pulse until smooth. Enjoy!', NULL),
(19, 'Step 1:\r\nPlace the banana, yogurt, almond milk, baby spinach, maple syrup, and salt into a blender. Blend on high until smooth. Pour the mixture into a glass bowl and stir in the chia seeds. Cover the bowl and place into the refrigerator. Let the mixture sit for at least 2 hours or overnight. Stir well before serving and top with a sprinkle of granola and raspberries. Enjoy!', NULL),
(20, 'Step 1:\r\nFinely chop kale and place in a large bowl.\r\n\r\nStep 2:\r\nRinse and drain beans, slice the tomatoes in half, and add them both to the bowl.\r\n\r\nStep 3:\r\nAdd the pesto and then toss with lemon juice until everything is coated.', NULL),
(21, 'Step 1:\r\nPut the egg yolks into a bowl, finely grate in the Parmesan, season with pepper, then mix well with a fork and put to one side.\r\n\r\nStep2:\r\nCut any hard skin off the pancetta and set aside, then chop the meat.\r\n\r\nStep 3:\r\nCook the spaghetti in a large pan of boiling salted water until al dente.\r\n\r\nStep 4:\r\nMeanwhile, rub the pancetta skin, if you have any, all over the base of a medium frying pan (this will add fantastic flavour, or use 1 tablespoon of oil instead), then place over a medium-high heat.\r\n\r\nStep 5:\r\nPeel the garlic, then crush with the palm of your hand, add it to the pan and leave it to flavour the fat for 1 minute. Stir in the pancetta, then cook for 4 minutes, or until it starts to crisp up.\r\n\r\nStep 6:\r\nPick out and discard the garlic from the pan, then, reserving some of the cooking water, drain and add the spaghetti. Toss well over the heat so it really soaks up all that lovely flavour, then remove the pan from the heat.\r\n\r\nStep 7:\r\nAdd a splash of the cooking water and toss well, season with pepper, then pour in the egg mixture – the pan will help to cook the egg gently, rather than scrambling it. Toss well, adding more cooking water until it’s lovely and glossy.\r\n\r\nStep 8:\r\nServe with a grating of Parmesan and an extra twist of pepper.', NULL),
(22, 'Step 1:\r\nLay out the cutlets, remove any skin and pound until thin. Season on both sides with salt and pepper. Place flour and breadcrumbs into separate flat plates, beat the eggs together on a further plate using a fork.\r\nCoat each schnitzel on both sides in flour, then draw through the beaten eggs, ensuring that no part of the schnitzel remains dry. Lastly, coat in the breadcrumbs and carefully press down the crumbs using the reverse side of the fork (this causes the crumb coating to “fluff up” better during cooking).\r\n\r\nStep 2:\r\nIn a large pan (or 2 medium-sized pans), melt sufficient clarified butter for the schnitzel to be able to swim freely in the oil (or heat up the plant oil with 1 – 2 tbsp of clarified butter or butter).\r\nOnly place the schnitzel in the pan when the fat is so hot that it hisses and bubbles up if some breadcrumbs or a small piece of butter is added to it.\r\nDepending on the thickness and the type of meat, fry for 2 to 4 minutes until golden brown. Turn using a spatula (do not pierce the coating!) and fry on the other side until it is of similar colour.\r\n\r\nStep 3:\r\nRemove the crispy schnitzel and place on kitchen paper to dry off. Dab carefully. Arrange the schnitzel on the plate and garnish with slices of lemon before serving.\r\nServe with parsley potatoes, rice, potato salad or mixed salad.', NULL),
(23, 'Step1:\r\nPlace 350g of firm tofu on a plate lined with kitchen paper, then place another layer of kitchen paper on top – this will help soak up some of the moisture. Set aside until ready to use.\r\n\r\nStep 2:\r\nPlace a large frying pan over a medium heat, carefully cut the tofu into quarters, then cut each piece into four again. Add 1 teaspoon of groundnut oil to the pan, then add the tofu and leave to cook for 10 to 15 minutes, or until golden and crisp, turning halfway. Remove to a bowl.\r\n\r\nStep 3:\r\nToast 2 tablespoons of sesame seeds in the pan, then toss with the tofu to coat.\r\n\r\nStep 4:\r\nIn a small bowl, mix ½ a tablespoon of cornflour, 2 tablespoons of soy sauce and 1 tablespoon of white wine vinegar until combined.\r\n\r\nStep 5:\r\nPeel and finely chop 1 clove of garlic and trim and finely slice 1 fresh red chilli. Peel a 5cm piece of ginger, then slice into matchsticks. Snap the woody ends from 320g asparagus, and slice on the bias.\r\n\r\nStep 6:\r\nPlace a wok over a high heat and add 1 teaspoon of groundnut oil. Once hot, stir in the garlic, chilli and ginger, followed by the asparagus and 150g of beansprouts. Cook for a couple of minutes, or until everything is fragrant and golden, stirring continuously.\r\n\r\nStep 7:\r\nStir in the cornflour mixture, reduce the heat to medium and cook for 4 to 5 minutes, or until the sauce has thickened, adding a splash of water, if needed.\r\n\r\nStep 8:\r\nServe the veggies alongside the tofu with some extra sliced red chilli and cooked rice noodles, if you like.', NULL),
(24, 'Step 1:\r\nIn a bowl, mix ground beef, egg, onion, bread crumbs, Worcestershire, garlic, 1/2 teaspoon salt, and 1/4 teaspoon pepper until well blended. Divide mixture into four equal portions and shape each into a patty about 4 inches wide.\r\n\r\nStep 2:\r\nLay burgers on an oiled barbecue grill over a solid bed of hot coals or high heat on a gas grill (you can hold your hand at grill level only 2 to 3 seconds); close lid on gas grill. Cook burgers, turning once, until browned on both sides and no longer pink inside (cut to test), 7 to 8 minutes total. Remove from grill.\r\nStep 3:\r\nLay buns, cut side down, on grill and cook until lightly toasted, 30 seconds to 1 minute.\r\n\r\nStep 4:  Spread mayonnaise and ketchup on bun bottoms. Add lettuce, tomato, burger, onion, and salt and pepper to taste. Set bun tops in place.', NULL),
(25, 'Step 1:\r\nIn a large pot of boiling salted water, cook the spaghetti until just al dente, then drain the pasta well.\r\n\r\nStep 2:\r\nMeanwhile, in a large, deep skillet, heat the olive oil. Add the minced garlic and crushed red pepper and cook over moderately high heat, stirring occasionally, until the garlic is lightly browned, about 1 1/2 minutes. Add the clams and water, cover and simmer until the clams open and are just cooked through, 5 to 8 minutes. Discard any clams that don\'t open.\r\n\r\nStep 3:\r\nAdd the spaghetti and the chopped parsley to the clams in the skillet and season with pepper. Toss over moderately high heat just until the spaghetti absorbs some of the juices, about 1 minute. Transfer the spaghetti and clams to shallow bowls and serve right away.', NULL),
(26, 'Step 1:\r\nPreheat a griddle pan or barbecue.\r\n\r\nStep 2:\r\nTrim and slice the aubergines 1cm thick. Peel and finely chop the onion, and peel and finely slice the garlic.\r\n\r\nStep 3:\r\nPlace a large pan on a medium heat with 2 or 3 lugs of olive oil, add the onion, garlic and dried oregano, then cook for 10 minutes, or until the onion is soft and the garlic has a tiny bit of colour.\r\n\r\nStep 4:\r\nIf you’re using tinned tomatoes, break them up, and if you’re using fresh tomatoes (which will obviously taste sweeter and more delicious, if they’re in season), very quickly prick each one and put them into a big pan of boiling water for 40 seconds. Remove from the pan with a slotted spoon and put them into a bowl of cold water for 30 seconds, then remove the skins, carefully squeeze out the pips and cut up the flesh.\r\n\r\nStep 5:\r\nAdd the tomato flesh or tinned tomatoes to the onion pan, give the mixture a good stir, then put a lid on and simmer slowly for 15 minutes, or until thickened and reduced.\r\n\r\nStep 6:\r\nGrill the aubergines on both sides until lightly charred – you\'ll need to work in batches.\r\nSeason the tomato sauce carefully with sea salt, black pepper and a tiny swig of wine vinegar, then pick in the basil. You can leave the sauce chunky or you can purée it.\r\n\r\nStep 7:\r\nSpoon a layer of tomato sauce into a 15cm x 25cm baking dish, then add a fine scattering of Parmesan, followed by a single layer of aubergines. Repeat these layers until you’ve used all the ingredients up, finishing with a little sauce and another good sprinkling of Parmesan.\r\nPick and finely chop the oregano, then toss with the breadcrumbs and a little olive oil, then sprinkle on top of the Parmesan. Tear over the mozzarella (if using).\r\n\r\nStep 8:\r\nBake at 190°C/375°F/gas 5 for 30 minutes, or until golden, crisp and bubbly – it’s best eaten straight away, but it can also be served cold.', NULL),
(27, 'Step 1:\r\nPreheat the oven to 200°C Prepare a parchment lined baking sheet. Oil lightly.\r\n\r\nStep 2:\r\nCombine the bread and milk in a large bowl and set aside to soak.\r\n\r\nStep 3:\r\nMeanwhile, combine the pork, beef, onion, tomato sauce, eggs, Parmigiano-Reggiano, salt, and pepper in a large bowl. Gently squeeze out any excess liquid from the bread mixture so the bread is not dripping but is thoroughly moistened. Fold in the meat mixture.\r\n\r\nStep 4:\r\nForm the mixture into loose balls approximately the size of a golf ball and transfer to the prepared baking sheet.\r\n\r\nStep 5:\r\nRoast until deeply caramelized on the outside and cooked through on the inside, 20 to 25 minutes.\r\n\r\nStep 6:\r\nThe cooled meatballs will keep in a sealed container in the refrigerator for 4 days or in the freezer for up to 3 months.', NULL),
(28, 'Step 1:\r\nIn a bowl, cover 100g of fine rice noodles with boiling kettle water to rehydrate them.\r\n\r\nStep 2:\r\nTo make a sauce, drain the juice from 1 x 227g tin of pineapple chunks into a separate bowl, mix with 2 heaped teaspoons of cornflour, 1 tablespoon of cider vinegar, 2 teaspoons low-salt soy sauce and 4 tablespoons of water, then put aside.\r\n\r\nStep 3:\r\nPut a wok or large frying pan on a high heat and lightly toast 2 teaspoons of sesame seeds while it heats up, then tip into a little bowl.\r\n\r\nStep4:\r\nPlace the pineapple chunks in the dry pan, then roughly chop 30g of cashew nuts and add 1 minute later.\r\n\r\nStep 5:\r\nTrim 4 spring onions, slice into 2cm chunks and add to the pan. Let it all char and get attitude while you peel 2 cloves of garlic and a 2cm piece of ginger, finely slice them with 1 fresh red chilli (deseed if you like), and finely slice 200g of sugar snaps at an angle lengthways.\r\n\r\nStep 6:\r\nAdd 1 tablespoon of groundnut oil to the pan, then add the garlic, ginger and chilli. Toss for 30 seconds, then toss in the sugar snaps and the more robust sprouts (200g total) for 1 minute, followed by the sauce. Bring it to the boil for a minute or two to thicken, then taste and season to perfection.\r\n\r\nStep 7:\r\nServe the stir-fry on top of the drained noodles. Quickly return the empty pan to the heat, pour in a good splash of boiling kettle water, use a wooden spoon to really scrape up all that delicious sticky goodness from the bottom, stirring for 1 minute until slightly thickened, then drizzle over the stir-fry.\r\n\r\nStep 8:\r\nSprinkle over any delicate sprouts, such as alfalfa, along with the toasted sesame seeds, and serve with lime wedges, for squeezing over.', NULL),
(29, 'Step 1:\r\nPut a large shallow casserole pan on a medium-high heat.\r\n\r\nStep 2:\r\nFinely slice the bacon, if using, and sprinkle into the pan with 1 tablespoon of olive oil, stirring occasionally while you prep your veg.\r\n\r\nStep 3:\r\nPeel and finely chop the garlic and onion, adding the garlic to the pan with the bay leaves as soon as the bacon turns golden, followed by the onions.\r\n\r\nStep 4:\r\nTrim and chop the carrots and celery into rough 1cm dice, adding to the pan as you go. Remove and finely chop any tough stalks from your greens and add to the pan. Cook for 10 to 15 minutes, stirring regularly, or until softened and caramelised.\r\n\r\nStep 5:\r\nCrumble in the stock cube, pour in the tinned tomatoes, breaking them up with your spoon, then add 1 tin’s worth of water.\r\n\r\nStep 6:\r\nPour in the beans, juice and all, then add a pinch of sea salt and black pepper.\r\nShred your greens and sprinkle into the pan, top up with 600ml of boiling kettle water, then add the pasta. Cover and leave to simmer for 10 to 15 minutes, or until the pasta is just cooked and the soup has thickened to your liking.\r\n\r\nStep 7:\r\nSeason the soup to perfection, then serve it with a grating of Parmesan cheese and a drizzle of extra virgin olive oil. A sprinkling of fresh baby basil leaves will always be delicious, if you’ve got them, and my kids enjoy it with a dollop of pesto on top, too', NULL),
(30, 'Step 1:\r\nCook the vegetables: \r\nHeat 3 tablespoons olive oil in a large pot (4 quarts or larger) over medium heat. Add the onion and cook, stirring occasionally, for 3 minutes. Add the celery, carrot, and garlic and sauté until the vegetables soften, about 5 minutes.\r\n\r\nStep 2:\r\nAdd the spices and sweet pepper paste: \r\nAdd cumin and oregano and stir the spices into the vegetable mixture. Add the tatli biber salçasi and stir until evenly distributed.\r\n\r\nStep 3:\r\nAdd the lentils and vegetable stock: \r\nAdd the lentils to the pot and stir to distribute evenly into the vegetable mixture. Add the vegetable stock and stir. Let the soup come to a boil.\r\n\r\nStep 4:\r\nTurn the heat to low, place the lid on the pot, and let the soup simmer until the lentils and vegetables are tender, about 20 minutes.\r\n\r\nStep 5:\r\nBlend the soup and season: \r\nRemove the soup from the heat. Use an immersion blender to purée the soup or work in batches and purée the soup in a blender with the lid cracked.\r\nAdd lemon juice, salt, and pepper to taste.\r\n\r\nStep 6:\r\nPrepare the pul biber butter drizzle: \r\nHeat a small saucepan over medium heat and add the butter. Cook the butter until just beginning to turn golden brown, about 3 minutes. Remove from the heat and add 2 teaspoons olive oil and 2 teaspoons pul biber. Stir to combine.\r\n\r\nStep 7:\r\nGarnish and serve soup: \r\nLadle the soup into bowls. Add 1 tablespoon of Greek yogurt on the top of each soup followed by croutons, a drizzle of the pul biber butter, and a sprinkle of chopped fresh parsley and extra pul biber. Serve.\r\n\r\nStep 7:\r\nLeftovers can be stored in an airtight container in the fridge and eaten within 5 days or frozen for up to 3 months. Reheat the soup in the microwave or in a saucepan on low heat.', NULL),
(31, 'Step 1:\r\nHalve the salmon fillets lengthways, then cut the skin off each piece. Scatter the sesame seeds across a plate, then lay the salmon slices in them to completely coat one side only. Pour the excess sesame seeds into a pestle and mortar and pound into a paste. Pick and pound in most of the mint leaves, saving the pretty ones, muddle in the juice of 1 orange and a swig each of extra virgin olive oil and red wine vinegar, then season to perfection. \r\n\r\nStep 2:\r\nPut a 30cm non-stick frying pan on a medium-high heat, add the grains with a good splash of water, and heat through. Once hot, pour in the dressing, toss together well, then remove to a platter or serving bowl.\r\n\r\nStep 3:\r\nWipe out the pan, return to a medium-high heat, fry the salmon skin for a couple of minutes, until crispy on both sides, then remove. Add the salmon, sesame side down, and fry for 3 minutes, then flip for 1 minute on the other side, or until cooked through. Meanwhile, wash the carrots and use a speed-peeler to peel them into ribbons. Toss in a drizzle each of extra virgin olive oil and red wine vinegar, season, and add to the grains. Peel the remaining orange, finely slice into rounds, divide between your plates and sit the salmon and crispy skin on top. Spoon over the harissa, then sprinkle both salmon and grains with the reserved mint, to finish.', NULL),
(32, 'Step 1:\r\nScrub 1 sweet potato (300g) and slice into rounds, about ½cm thick. Trim 1 aubergine (250g) and 2 mixed-colour peppers, then chop into 3cm chunks.\r\n\r\nStep 2:\r\nChar the vegetables in a large dry casserole pan over a high heat for 5 minutes – work in batches, removing to a plate as you go.\r\n\r\nStep 3:\r\nPeel and finely slice 2 onions, then place in the large casserole pan on a medium heat with a splash of olive oil and cook for 10 minutes, stirring regularly.\r\n\r\nStep 4:\r\nFinely chop the stalks from ½ a bunch of fresh coriander (15g), reserving the leaves for later, along with 30g of sun-dried tomatoes, then add to the pan.\r\n\r\nStep 5:\r\nStir in 2 tablespoons of Thai curry paste (choose your favourite) and cook for a further 3 minutes, then pour in ½ x 400g tin of light coconut milk and 400ml of boiling kettle water, and mix well.\r\n\r\nStep 6:\r\nAdd the charred veg back into the pan, pop the lid on, reduce the heat to low and cook gently for 10 minutes, throwing the mangetout in for the final 2 minutes.\r\nSeason with 2 teaspoons of soy or fish sauce, then finely chop and scatter over the coriander leaves.\r\n\r\nStep 7:\r\nCut 1 lime into wedges for squeezing over, then serve up, with flatbreads on the side, if you like.', NULL);

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
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `recipes`
--

INSERT INTO `recipes` (`id`, `fk_procedure_id`, `name`, `picture`, `category`, `servings`, `price`, `time`, `status`, `fk_user_id`) VALUES
(11, 12, 'Pasta with Fresh Tomato Sauce', 'pastaPomodoro-6399ca819f887.jpg', 'Vegetarian', 1, '5.00', '10', 'in progress', 6),
(12, 13, 'Gluten-Free Pancakes', 'default.png', 'Vegetarian', 1, '3.00', '7', 'aproved', 6),
(13, 14, 'Gluten-Free Pancakes', 'pancakes-6399cca421cee.jpg', 'Vegetarian', 1, '3.00', '7', 'aproved', 6),
(14, 15, 'Chickpea Mash Salad', 'Chickpea-6399cd210a459.jpg', 'Vegetarian', 2, '5.00', '10', 'in progress', 5),
(15, 16, 'Vegan Banana Pancakes', '207252-paperplanes-6b770039-07a0-4b91-8d34-8984e3ec115f-6399cd9987f7d.jpg', 'Vegan', 1, '3.00', '30', 'aproved', 5),
(16, 17, 'Simple Mixed Greens Salad', 'salad-6399ce8fabce1.jpg', 'Vegetarian', 2, '5.00', '10', 'aproved', 5),
(17, 18, 'Strawberry, Peach, and Chia Smoothie', 'smoothie-6399d55959826.jpg', 'Vegan', 1, '1.00', '7', 'aproved', 5),
(18, 19, 'SuperGreen Chia Pudding', 'chiaPudding-6399cf63858ea.jpg', 'Vegetarian', 2, '2.00', '5', 'aproved', 5),
(19, 20, 'Kale White Bean and Pesto Salad', 'KaleSalad-6399cff933d83.jpg', 'Vegetarian', 2, '3.00', '5', 'aproved', 5),
(20, 21, 'Gennaro\'s classic spaghetti carbonara', 'spaghetti-carbonara-6399d0f85b6cc.jpg', 'Universal', 2, '10.00', '10', 'aproved', 5),
(21, 22, 'Wiener Schnitzel', 'wiener-schnitzel-default-6399d1cd791e2.jpg', 'Universal', 2, '15.00', '30', 'in progress', 5),
(22, 23, 'Asparagus stir-fry', 'Asparagusstirfry-6399d3a155c2f.png', 'Vegan', 4, '12.00', '50', 'in progress', 5),
(23, 24, 'Hamburger', 'Hamburger-with-Sesame-Seeds-Cheese-and-Veggies-6399d4e21dd21.png', 'Universal', 2, '20.00', '30', 'in progress', 5),
(24, 25, 'Spaghetti with Clams', 'clark-douglas-17ZU9BPy-Q4-unsplash-6399ddc2b452f.jpg', 'Universal', 6, '40.00', '20', 'aproved', 5),
(25, 26, 'Aubergine Parmigiana (Melanzane alla Parmigiana)', 'Parmigiana-di-Melanzane-6399dd3c949a0.jpg', 'Vegetarian', 6, '25.00', '90', 'aproved', 5),
(26, 27, 'Perfect italian Meatballs', 'meatball-6399dd1e856d2.jpg', 'Universal', 3, '15.00', '60', 'aproved', 5),
(27, 28, 'Sweet & sour stir-fry', 'stirfry-6399d8f766112.png', 'Vegan', 2, '15.00', '21', 'aproved', 5),
(28, 29, 'Minestrone soup', 'victoria-shes-90Z4qIxWc8Y-unsplash-6399dd7cd0ac5.jpg', 'Vegetarian', 8, '25.00', '30', 'aproved', 5),
(29, 30, 'Turkish Mercimek soup / Red Lentil Soup', 'Turkish-red-lentil-soup-recipe-6399daeb3518f.jpg', 'Vegetarian', 2, '12.00', '30', 'aproved', 5),
(30, 31, 'Sesame seared salmon', 'default.png', 'Universal', 2, '10.00', '21', 'in progress', 5),
(31, 32, '5-a-day spiced veg stew', 'spicedvegstew-6399dc16028db.png', 'Vegan', 2, '16.00', '53', 'aproved', 6);

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
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `gender`, `picture`, `status`) VALUES
(5, 'admin@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$WqGD5PXKVqoHnSpVM8ApTOeSxfIv7DtIE4ems2c9bhhGsOMy0yybC', 'admin', 'female', 'christopher-campbell-rDEOVtE7vOs-unsplash-6399c3b91dc80.jpg', NULL),
(6, 'user@mail.com', '[]', '$2y$13$WqGD5PXKVqoHnSpVM8ApTOeSxfIv7DtIE4ems2c9bhhGsOMy0yybC', 'user', 'female', 'alexander-hipp-iEEBWgY-6lA-unsplash-6399c4742e136.jpg', NULL),
(8, 'blocked@mail.com', '[\"ROLE_BLOCKED\"]', '$2y$13$WqGD5PXKVqoHnSpVM8ApTOeSxfIv7DtIE4ems2c9bhhGsOMy0yybC', 'blocked', 'none', 'userDefault.png', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weekplanner`
--

CREATE TABLE `weekplanner` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `meal_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_user_id` int(11) DEFAULT NULL,
  `fk_recipes_id` int(11) DEFAULT NULL,
  `weekday` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD UNIQUE KEY `UNIQ_A369E2B537F9BECB` (`fk_procedure_id`),
  ADD KEY `IDX_A369E2B55741EEB9` (`fk_user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT für Tabelle `join_recipe`
--
ALTER TABLE `join_recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT für Tabelle `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `procedure`
--
ALTER TABLE `procedure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT für Tabelle `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `weekplanner`
--
ALTER TABLE `weekplanner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  ADD CONSTRAINT `FK_A369E2B537F9BECB` FOREIGN KEY (`fk_procedure_id`) REFERENCES `procedure` (`id`),
  ADD CONSTRAINT `FK_A369E2B55741EEB9` FOREIGN KEY (`fk_user_id`) REFERENCES `user` (`id`);

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
