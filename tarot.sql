-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 13, 2025 at 09:49 PM
-- Server version: 8.0.35
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tarot`
--

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `upright` varchar(1000) NOT NULL,
  `reversed` varchar(1000) NOT NULL,
  `suit_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`id`, `title`, `poster`, `upright`, `reversed`, `suit_id`) VALUES
(1, 'The Fool', 'fool.webp', 'New beginnings, innocence, adventure\r\n', 'Recklessness, foolishness', 1),
(2, 'The Tower', 'tower.webp', 'Sudden change, upheaval, revelation', 'Fear of change, delayed disaster', 1),
(3, 'Two of Cups', 'two-cups.webp', 'Union, partnership, connection', 'Imbalance, tension, broken communication', 2),
(4, 'Queen of Cups', 'queen-cups.webp', 'Compassion, intuition, care', 'Emotional insecurity, codependency', 2),
(5, 'Ace of Swords', 'ace-swords.webp', 'Breakthrough, clarity, truth', 'Confusion, miscommunication', 3),
(6, 'Three of Swords', 'three-swords.webp', 'Heartbreak, grief, sorrow', 'Recovery, forgiveness, moving on', 3),
(7, 'Seven of Wands', 'seven-wands.webp', 'Challenge, perseverance, standing your ground', 'Giving up, overwhelm, defensiveness\r\n', 4),
(8, 'Knight of Wands', 'knight-wands.webp', 'Adventure, energy, passion', ' Impulsiveness, recklessness', 4),
(9, 'Ten of Pentacles', 'ten-pentacles.webp', 'Legacy, stability, wealth', 'Financial failure, loss, instability', 5),
(10, 'Page of Pentacles', 'page-pentacles.webp', 'Manifestation, opportunity, new job', 'Lack of progress, procrastination', 5);

-- --------------------------------------------------------

--
-- Table structure for table `suits`
--

CREATE TABLE `suits` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `element` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suits`
--

INSERT INTO `suits` (`id`, `name`, `element`, `description`) VALUES
(1, 'Major Arcana', 'Spirit', 'Karmic lessons'),
(2, 'Cups', 'Water', 'Emotions, relationships, intuition'),
(3, 'Swords', 'Air', 'Thoughts, conflict, communication'),
(4, 'Wands', 'Fire', 'Creativity, action, drive'),
(5, 'Pentacles', 'Earth', 'Finances, security, material world');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suit_id` (`suit_id`);

--
-- Indexes for table `suits`
--
ALTER TABLE `suits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `suits`
--
ALTER TABLE `suits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cards`
--
ALTER TABLE `cards`
  ADD CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`suit_id`) REFERENCES `suits` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
