-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2023 at 04:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `taskmanager`
--

CREATE TABLE `taskmanager` (
  `id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cat` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `subtask` longtext NOT NULL,
  `note` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taskmanager`
--

INSERT INTO `taskmanager` (`id`, `title`, `cat`, `date`, `subtask`, `note`, `userid`) VALUES
(1, 'Dev Competition', 'Work', '1692887848336', '[{\"id\":1692878914,\"descrp\":\"start the ui design\",\"status\":0},{\"id\":1692878915,\"descrp\":\"buid the api\",\"status\":1},{\"id\":1692878916,\"descrp\":\"debug the errors\",\"status\":1}]', 'finish it before weekend!', 1),
(2, 'Fix the bikes', 'Personal', '1692887848336', '[{\"id\":1692879046,\"descrp\":\"change the pedal\",\"status\":0},{\"id\":1692879047,\"descrp\":\"buy spray paint\",\"status\":1}]', 'Do it after evening', 1),
(4, 'Start the big project', 'Important', '1692889358727', '[{\"id\":1692889358,\"descrp\":\"initial it\",\"status\":0},{\"id\":1692889359,\"descrp\":\"make changes\",\"status\":1},{\"id\":1692889360,\"descrp\":\"tablet the contents\",\"status\":1},{\"id\":1692889361,\"descrp\":\"modulize it\",\"status\":0}]', 'Needs to be started before monday', 1),
(7, 'New Dev', 'Personal', '1692952022366', '[{\"id\":1692952022,\"descrp\":\"Make it\",\"status\":0}]', 'Just now', 1),
(24, 'dsa', 'Important', '1692967446356', '[{\"id\":1692967446,\"descrp\":\"dasd\",\"status\":0}]', 'asda', 2),
(25, 'dsfs', 'Important', '1692967626454', '[{\"id\":1692967626,\"descrp\":\"dfs\",\"status\":0},{\"id\":1692967627,\"descrp\":\"asda\",\"status\":0},{\"id\":1692967628,\"descrp\":\"asda\",\"status\":0}]', 'adsd', 2);

-- --------------------------------------------------------

--
-- Table structure for table `taskusers`
--

CREATE TABLE `taskusers` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taskusers`
--

INSERT INTO `taskusers` (`id`, `username`, `email`, `pwd`) VALUES
(1, 'kelvin', 'kelvin@gmail.com', '1357246'),
(2, 'james', 'james@gmail.com', '1357246');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `taskmanager`
--
ALTER TABLE `taskmanager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`);

--
-- Indexes for table `taskusers`
--
ALTER TABLE `taskusers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `taskmanager`
--
ALTER TABLE `taskmanager`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `taskusers`
--
ALTER TABLE `taskusers`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `taskmanager`
--
ALTER TABLE `taskmanager`
  ADD CONSTRAINT `taskmanager_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `taskusers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
