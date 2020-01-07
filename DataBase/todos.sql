-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 17 déc. 2019 à 12:26
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `todos`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE `action` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `action` varchar(30) NOT NULL,
  `global` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`id`, `name`, `action`, `global`) VALUES
(1, 'Checked', 'checked', 0),
(2, 'Ordered', 'ordered', 0),
(3, 'Labeled', 'labeled', 0);

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `label` varchar(45) DEFAULT NULL,
  `checked` tinyint(1) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `dateC` datetime DEFAULT NULL,
  `dateM` datetime DEFAULT NULL,
  `idSlate` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `label`, `checked`, `value`, `order`, `dateC`, `dateM`, `idSlate`, `idUser`) VALUES
(2, 'Pain', 0, '', 0, '2019-11-25 11:06:16', '2019-11-25 11:06:16', 1, NULL),
(3, 'tempus risus.', 1, NULL, NULL, '2020-05-10 19:42:09', '2020-01-28 20:07:30', 20, NULL),
(4, 'laoreet lectus quis', 1, NULL, NULL, '2019-06-28 23:47:36', '2018-12-14 23:38:07', 1, NULL),
(5, 'Eau', 0, '', 0, '2019-11-25 10:00:00', '2019-11-25 10:00:00', 1, NULL),
(6, 'lectus rutrum urna, nec luctus', 0, NULL, NULL, '2019-01-25 18:50:56', '2019-08-31 03:11:15', 1, NULL),
(7, 'Proin dolor. Nulla semper', 0, NULL, NULL, '2020-01-20 17:13:33', '2019-05-11 00:19:20', 34, NULL),
(8, 'tempor diam dictum sapien.', 1, NULL, NULL, '2020-07-20 00:13:35', '2020-01-29 12:36:55', 31, NULL),
(9, 'Sed neque. Sed eget', 1, NULL, NULL, '2020-08-23 05:16:41', '2019-06-14 11:32:31', 8, NULL),
(10, 'commodo tincidunt nibh.', 1, NULL, NULL, '2019-05-11 00:12:02', '2019-10-03 02:06:47', 30, NULL),
(11, 'luctus, ipsum leo elementum', 0, NULL, NULL, '2019-10-14 04:22:35', '2020-10-24 13:14:53', 10, NULL),
(12, 'consectetuer adipiscing elit.', 0, NULL, NULL, '2020-04-06 18:27:03', '2020-08-14 14:55:18', 36, NULL),
(13, 'Nulla facilisis. Suspendisse commodo', 1, NULL, NULL, '2019-08-28 15:28:01', '2020-08-25 15:15:54', 9, NULL),
(14, 'Nullam enim. Sed nulla ante,', 0, NULL, NULL, '2019-01-24 13:21:05', '2019-05-17 10:53:27', 23, NULL),
(15, 'dictum sapien.', 1, NULL, NULL, '2019-09-19 14:50:34', '2020-08-16 18:06:28', 34, NULL),
(16, 'malesuada ut, sem.', 1, NULL, NULL, '2019-07-13 19:07:57', '2020-11-06 02:47:52', 24, NULL),
(17, 'sit amet', 0, NULL, NULL, '2020-10-11 23:38:17', '2019-09-01 20:27:23', 22, NULL),
(18, 'felis,', 0, NULL, NULL, '2020-06-21 00:12:14', '2019-03-25 09:54:46', 38, NULL),
(19, 'dolor. Quisque', 1, NULL, NULL, '2019-04-05 10:28:25', '2020-12-04 17:58:31', 19, NULL),
(20, 'auctor quis,', 1, NULL, NULL, '2019-08-21 11:58:58', '2019-12-08 19:01:31', 20, NULL),
(21, 'et ultrices posuere cubilia', 1, NULL, NULL, '2019-04-22 14:37:44', '2020-05-04 01:09:51', 14, NULL),
(22, 'consequat,', 1, NULL, NULL, '2018-12-17 08:13:13', '2019-08-12 04:52:09', 14, NULL),
(23, 'lorem tristique', 1, NULL, NULL, '2020-05-05 03:51:29', '2020-08-02 16:05:15', 27, NULL),
(24, 'egestas ligula. Nullam', 0, NULL, NULL, '2019-03-19 17:43:13', '2019-09-04 02:57:25', 36, NULL),
(25, 'amet', 1, NULL, NULL, '2020-02-02 11:56:35', '2019-09-21 11:00:46', 34, NULL),
(26, 'tellus, imperdiet non,', 0, NULL, NULL, '2020-02-28 21:37:37', '2020-06-20 21:31:28', 9, NULL),
(27, 'orci, consectetuer euismod est arcu', 0, NULL, NULL, '2020-05-19 22:56:52', '2019-01-25 11:38:49', 11, NULL),
(28, 'Nam interdum enim', 1, NULL, NULL, '2019-01-30 16:09:15', '2019-02-12 05:14:52', 5, NULL),
(29, 'Integer mollis.', 1, NULL, NULL, '2020-09-14 22:08:42', '2019-08-10 14:27:01', 14, NULL),
(30, 'eu enim. Etiam imperdiet', 1, NULL, NULL, '2019-06-09 14:44:41', '2019-03-21 05:29:07', 18, NULL),
(31, 'turpis. In condimentum. Donec', 0, NULL, NULL, '2020-08-09 07:47:44', '2019-03-19 05:44:25', 4, NULL),
(32, 'vestibulum', 1, NULL, NULL, '2020-09-02 09:56:57', '2019-11-27 00:56:17', 10, NULL),
(33, 'neque', 0, NULL, NULL, '2019-09-18 18:34:11', '2018-12-24 11:10:30', 13, NULL),
(34, 'dolor. Fusce feugiat.', 0, NULL, NULL, '2020-03-30 18:31:45', '2019-06-10 10:46:09', 11, NULL),
(35, 'sapien.', 1, NULL, NULL, '2018-12-21 06:32:23', '2019-10-13 11:03:55', 17, NULL),
(36, 'Cras interdum. Nunc', 1, NULL, NULL, '2019-09-23 16:04:07', '2020-08-31 18:34:17', 2, NULL),
(37, 'amet', 1, NULL, NULL, '2020-06-14 16:12:43', '2019-01-16 14:45:50', 13, NULL),
(38, 'sagittis. Nullam vitae', 1, NULL, NULL, '2020-03-22 17:14:00', '2019-12-06 11:58:04', 5, NULL),
(39, 'tempor bibendum. Donec felis orci,', 0, NULL, NULL, '2020-01-15 06:59:08', '2020-11-23 16:37:11', 3, NULL),
(40, 'Nunc sed', 0, NULL, NULL, '2019-11-14 13:09:26', '2019-08-17 02:39:35', 30, NULL),
(41, 'ultrices, mauris ipsum porta elit,', 0, NULL, NULL, '2019-11-29 07:19:41', '2019-02-25 07:55:13', 18, NULL),
(42, 'Integer', 1, NULL, NULL, '2020-03-25 23:09:04', '2019-06-26 16:36:45', 18, NULL),
(43, 'orci lacus', 1, NULL, NULL, '2020-11-21 15:05:08', '2019-10-16 05:16:26', 29, NULL),
(44, 'Nam tempor diam dictum', 1, NULL, NULL, '2019-12-08 16:01:36', '2019-06-20 18:58:46', 15, NULL),
(45, 'ridiculus mus. Aenean eget', 0, NULL, NULL, '2019-05-23 11:14:33', '2020-09-22 06:56:47', 25, NULL),
(46, 'Aliquam rutrum lorem ac', 0, NULL, NULL, '2019-12-09 05:41:13', '2019-08-08 07:16:50', 7, NULL),
(47, 'dolor sit amet, consectetuer adipiscing', 0, NULL, NULL, '2019-02-16 07:08:56', '2019-12-18 07:14:32', 33, NULL),
(48, 'risus, at', 0, NULL, NULL, '2019-11-03 03:40:05', '2019-06-08 22:52:08', 17, NULL),
(49, 'metus. Vivamus euismod urna. Nullam', 1, NULL, NULL, '2020-05-23 12:06:29', '2018-12-27 07:31:23', 37, NULL),
(50, 'hymenaeos. Mauris ut quam', 0, NULL, NULL, '2019-02-28 17:21:26', '2020-03-16 04:45:58', 24, NULL),
(51, 'dapibus gravida. Aliquam', 1, NULL, NULL, '2019-09-30 02:07:54', '2020-02-10 00:32:12', 26, NULL),
(52, 'urna. Nunc quis arcu vel', 0, NULL, NULL, '2020-06-04 11:59:08', '2020-08-29 15:08:58', 6, NULL),
(53, 'Nunc mauris sapien, cursus in,', 1, NULL, NULL, '2018-12-08 19:16:42', '2019-11-05 14:18:27', 35, NULL),
(54, 'tincidunt aliquam', 1, NULL, NULL, '2020-10-06 22:21:42', '2020-01-04 17:40:18', 11, NULL),
(55, 'aliquam, enim', 1, NULL, NULL, '2019-07-21 02:21:43', '2020-07-18 11:31:31', 9, NULL),
(56, 'scelerisque neque sed sem', 1, NULL, NULL, '2019-06-11 05:31:57', '2020-05-09 19:08:25', 6, NULL),
(57, 'magna. Ut tincidunt', 1, NULL, NULL, '2019-09-14 11:33:07', '2019-06-03 14:21:58', 8, NULL),
(58, 'parturient montes,', 0, NULL, NULL, '2020-03-17 00:20:54', '2019-06-01 06:57:41', 1, NULL),
(59, 'vitae, posuere', 1, NULL, NULL, '2019-09-29 12:45:42', '2020-10-13 01:02:24', 41, NULL),
(60, 'nibh. Quisque nonummy ipsum non', 0, NULL, NULL, '2019-11-16 15:35:20', '2020-11-07 19:56:20', 12, NULL),
(61, 'augue id ante', 1, NULL, NULL, '2020-02-02 07:28:56', '2020-03-12 22:06:52', 38, NULL),
(62, 'id enim. Curabitur massa. Vestibulum', 1, NULL, NULL, '2020-07-15 21:01:14', '2019-06-03 14:43:54', 7, NULL),
(63, 'Aenean eget magna.', 0, NULL, NULL, '2020-03-16 14:58:30', '2020-05-18 12:11:11', 11, NULL),
(64, 'mi. Duis', 0, NULL, NULL, '2019-03-27 09:54:26', '2019-10-02 03:00:16', 22, NULL),
(65, 'ullamcorper, nisl arcu', 1, NULL, NULL, '2019-03-15 20:26:48', '2019-05-30 23:29:29', 21, NULL),
(66, 'lorem, eget mollis lectus', 1, NULL, NULL, '2019-03-16 18:12:26', '2019-07-17 07:33:29', 24, NULL),
(67, 'sollicitudin a, malesuada', 0, NULL, NULL, '2019-03-08 18:54:39', '2019-03-18 15:13:58', 13, NULL),
(68, 'mauris, rhoncus id,', 1, NULL, NULL, '2019-04-23 00:17:58', '2020-02-27 12:16:09', 35, NULL),
(69, 'et', 0, NULL, NULL, '2019-06-02 12:42:18', '2019-10-31 03:55:43', 16, NULL),
(70, 'viverra.', 0, NULL, NULL, '2020-07-09 06:09:37', '2020-02-13 19:40:49', 2, NULL),
(71, 'non lorem vitae', 1, NULL, NULL, '2020-09-13 12:55:11', '2019-04-06 09:49:42', 2, NULL),
(72, 'Integer eu lacus.', 1, NULL, NULL, '2020-05-12 07:43:12', '2020-06-18 19:56:23', 29, NULL),
(73, 'risus. Nulla eget metus', 0, NULL, NULL, '2020-11-29 02:57:52', '2019-09-02 18:20:55', 26, NULL),
(74, 'tellus lorem', 1, NULL, NULL, '2020-12-05 00:58:21', '2019-09-26 14:00:50', 32, NULL),
(75, 'non massa non ante', 1, NULL, NULL, '2020-08-09 08:35:45', '2019-04-26 03:34:55', 40, NULL),
(76, 'Proin nisl sem,', 0, NULL, NULL, '2020-08-29 21:14:02', '2019-10-23 04:24:36', 41, NULL),
(77, 'molestie in, tempus eu,', 0, NULL, NULL, '2019-12-16 02:43:17', '2020-04-24 06:06:59', 35, NULL),
(78, 'elementum, lorem ut', 1, NULL, NULL, '2020-03-26 13:41:47', '2019-03-13 16:23:11', 31, NULL),
(79, 'sapien, cursus in,', 0, NULL, NULL, '2020-06-01 11:16:04', '2020-09-06 14:59:40', 32, NULL),
(80, 'Fusce aliquam,', 1, NULL, NULL, '2019-07-29 19:13:53', '2019-09-13 01:43:30', 38, NULL),
(81, 'Quisque varius.', 0, NULL, NULL, '2019-08-02 00:20:18', '2019-04-29 11:15:52', 10, NULL),
(82, 'Nunc ut erat.', 1, NULL, NULL, '2019-07-31 07:20:59', '2020-04-01 20:20:15', 9, NULL),
(83, 'natoque penatibus et magnis dis', 1, NULL, NULL, '2020-09-16 12:19:40', '2019-02-17 16:44:06', 24, NULL),
(84, 'scelerisque,', 1, NULL, NULL, '2020-04-11 17:52:23', '2019-12-13 20:09:44', 8, NULL),
(85, 'libero mauris, aliquam eu,', 1, NULL, NULL, '2020-12-01 19:18:04', '2019-05-03 03:26:14', 19, NULL),
(86, 'non, dapibus rutrum,', 1, NULL, NULL, '2020-10-05 09:49:14', '2020-05-31 07:59:50', 11, NULL),
(87, 'at auctor', 0, NULL, NULL, '2019-12-21 13:56:48', '2019-07-04 11:39:34', 39, NULL),
(88, 'Morbi', 1, NULL, NULL, '2020-01-05 07:38:16', '2018-12-18 11:27:39', 4, NULL),
(89, 'egestas. Duis ac arcu.', 0, NULL, NULL, '2020-11-25 09:42:00', '2020-08-16 13:46:14', 23, NULL),
(90, 'lacus.', 1, NULL, NULL, '2019-01-23 07:32:49', '2020-07-16 05:27:24', 11, NULL),
(91, 'nec metus', 0, NULL, NULL, '2019-06-12 08:55:33', '2020-01-14 13:45:22', 34, NULL),
(92, 'lobortis ultrices. Vivamus', 1, NULL, NULL, '2019-12-24 11:42:11', '2019-12-26 22:06:17', 29, NULL),
(93, 'lobortis', 1, NULL, NULL, '2019-12-22 06:46:08', '2018-12-14 19:52:06', 6, NULL),
(94, 'non,', 0, NULL, NULL, '2020-08-26 06:32:23', '2019-09-19 05:08:21', 30, NULL),
(95, 'ipsum. Suspendisse', 1, NULL, NULL, '2020-10-03 23:56:43', '2020-03-11 19:44:34', 10, NULL),
(96, 'aliquam, enim nec tempus scelerisque,', 1, NULL, NULL, '2019-07-17 02:22:06', '2020-10-04 22:56:20', 16, NULL),
(97, 'Praesent interdum', 0, NULL, NULL, '2018-12-09 16:57:44', '2019-05-06 04:21:30', 12, NULL),
(98, 'Curabitur sed', 0, NULL, NULL, '2020-07-19 06:35:58', '2020-09-14 09:59:30', 11, NULL),
(99, 'dignissim', 1, NULL, NULL, '2020-06-10 05:48:12', '2019-08-26 09:47:50', 29, NULL),
(100, 'lectus. Cum sociis', 0, NULL, NULL, '2019-02-03 10:03:21', '2019-08-11 12:35:15', 37, NULL),
(101, 'et, commodo at, libero. Morbi', 0, NULL, NULL, '2019-11-19 16:47:25', '2020-07-16 20:33:49', 3, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `itemproperty`
--

CREATE TABLE `itemproperty` (
  `idItem` int(11) NOT NULL,
  `idProperty` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `value` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `itemproperty`
--

INSERT INTO `itemproperty` (`idItem`, `idProperty`, `idUser`, `value`) VALUES
(2, 1, 1, 'F00');

-- --------------------------------------------------------

--
-- Structure de la table `partage`
--

CREATE TABLE `partage` (
  `iduser` int(11) NOT NULL,
  `idSlate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `partage`
--

INSERT INTO `partage` (`iduser`, `idSlate`) VALUES
(1, 1),
(1, 2),
(1, 4),
(1, 6),
(1, 9),
(1, 10),
(1, 13),
(1, 16),
(1, 17),
(1, 20),
(1, 21),
(1, 22),
(1, 24),
(1, 25),
(1, 26),
(1, 31),
(1, 32),
(1, 33),
(1, 36),
(1, 37),
(1, 40);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `name`) VALUES
(1, 'color');

-- --------------------------------------------------------

--
-- Structure de la table `slate`
--

CREATE TABLE `slate` (
  `id` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `idUser` int(11) NOT NULL,
  `idTemplate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `slate`
--

INSERT INTO `slate` (`id`, `title`, `description`, `idUser`, `idTemplate`) VALUES
(1, 'Mes courses', 'Fieri, inquam, Triari, nullo pacto potest, ut non dicas, quid non probes eius, a quo dissentias. quid enim me prohiberet Epicureum esse, si probarem, quae ille diceret?', 1, 1),
(2, 'Proin Eget Odio Institute', 'dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum', 1, 1),
(3, 'Aliquet Industries', 'Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit', 2, 1),
(4, 'Placerat Augue Institute', 'id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue', 1, 2),
(5, 'Lacus Foundation', 'arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor.', 2, 1),
(6, 'Orci Ut Associates', 'eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra', 1, 2),
(7, 'Gravida Nunc Consulting', 'a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor', 2, 2),
(8, 'Mauris Morbi Corp.', 'tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce', 2, 1),
(9, 'Mattis Integer Company', 'penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis', 1, 2),
(10, 'Adipiscing Lacus Ut Associates', 'Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante', 1, 1),
(11, 'Pede Malesuada Vel Institute', 'non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque', 2, 1),
(12, 'Lectus Sit Corp.', 'Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing', 2, 3),
(13, 'Sit Associates', 'nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa.', 1, 1),
(14, 'Dictum Corporation', 'at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam', 2, 2),
(15, 'Vestibulum Neque Sed Inc.', 'non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate', 2, 2),
(16, 'Faucibus Associates', 'consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo.', 1, 2),
(17, 'Enim Commodo Hendrerit PC', 'luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis', 1, 1),
(18, 'Eget Odio Limited', 'tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede', 2, 2),
(19, 'Phasellus Dolor Corp.', 'magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec', 2, 3),
(20, 'Suspendisse Corporation', 'eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy', 1, 1),
(21, 'Metus Sit Amet LLC', 'mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque', 1, 3),
(22, 'Et Nunc Quisque Company', 'sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam', 1, 1),
(23, 'Integer LLC', 'Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,', 2, 1),
(24, 'Amet Dapibus Industries', 'Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper', 1, 3),
(25, 'Aliquam Arcu Ltd', 'massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu', 1, 1),
(26, 'Sem Semper Erat Incorporated', 'malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum', 1, 2),
(27, 'Lorem Fringilla Ornare LLC', 'pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.', 2, 1),
(28, 'Aliquet Magna Industries', 'Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit', 2, 2),
(29, 'Nunc Mauris Industries', 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu.', 2, 2),
(30, 'Dictum LLP', 'aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida', 2, 1),
(31, 'Libero LLP', 'egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse', 1, 1),
(32, 'Placerat Cras Ltd', 'nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.', 1, 2),
(33, 'Consectetuer Rhoncus Nullam Corp.', 'mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu.', 1, 2),
(34, 'Arcu Curabitur Company', 'arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec tincidunt. Donec vitae erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor,', 2, 3),
(35, 'Vivamus Sit Amet Corporation', 'iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin', 2, 1),
(36, 'Non Institute', 'neque vitae semper egestas, urna', 1, 3),
(37, 'Sem Foundation', 'purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus. Donec nibh enim, gravida sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed', 1, 3),
(38, 'Ridiculus Mus Limited', 'sapien molestie orci', 2, 2),
(39, 'Mi Institute', 'urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac', 2, 2),
(40, 'Eleifend Vitae Erat Institute', 'Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit', 1, 2),
(41, 'Odio Semper Cursus Corporation', 'tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `template`
--

CREATE TABLE `template` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `template`
--

INSERT INTO `template` (`id`, `name`, `description`, `idUser`) VALUES
(1, 'Todo', 'Todo list simple', NULL),
(2, 'checked', 'todo with checkbox', NULL),
(3, 'ordered', 'todo ordered', NULL),
(4, 'template du user 1', 'loream ipsum mes fesses', 1),
(5, 'template user 2', 'lorea blabla', 2);

-- --------------------------------------------------------

--
-- Structure de la table `templateaction`
--

CREATE TABLE `templateaction` (
  `idTemplate` int(11) NOT NULL,
  `idAction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `templateaction`
--

INSERT INTO `templateaction` (`idTemplate`, `idAction`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `templateproperty`
--

CREATE TABLE `templateproperty` (
  `idTemplate` int(11) NOT NULL,
  `idProperty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `fname`, `name`, `email`, `password`) VALUES
(1, 'jc', 'JC HERON', 'myaddressmail@gmail.com', '0000'),
(2, 'Thomas', 'FONTAINE--TUFFERY', 'root@root.root', 'root');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Item_Slate1_idx` (`idSlate`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `itemproperty`
--
ALTER TABLE `itemproperty`
  ADD PRIMARY KEY (`idItem`,`idProperty`,`idUser`) USING BTREE,
  ADD KEY `fk_Item_has_Property_Property1_idx` (`idProperty`),
  ADD KEY `fk_Item_has_Property_Item1_idx` (`idItem`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `partage`
--
ALTER TABLE `partage`
  ADD PRIMARY KEY (`iduser`,`idSlate`),
  ADD KEY `fk_user_has_Slate_Slate1_idx` (`idSlate`),
  ADD KEY `fk_user_has_Slate_user1_idx` (`iduser`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `slate`
--
ALTER TABLE `slate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Slate_user_idx` (`idUser`),
  ADD KEY `fk_Slate_Template1_idx` (`idTemplate`);

--
-- Index pour la table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`name`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `templateaction`
--
ALTER TABLE `templateaction`
  ADD PRIMARY KEY (`idTemplate`,`idAction`),
  ADD KEY `fk_Template_has_Action_Action1_idx` (`idAction`),
  ADD KEY `fk_Template_has_Action_Template1_idx` (`idTemplate`);

--
-- Index pour la table `templateproperty`
--
ALTER TABLE `templateproperty`
  ADD PRIMARY KEY (`idTemplate`,`idProperty`),
  ADD KEY `fk_Template_has_Property_Property1_idx` (`idProperty`),
  ADD KEY `fk_Template_has_Property_Template1_idx` (`idTemplate`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `slate`
--
ALTER TABLE `slate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `template`
--
ALTER TABLE `template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk_Item_Slate1` FOREIGN KEY (`idSlate`) REFERENCES `slate` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `itemproperty`
--
ALTER TABLE `itemproperty`
  ADD CONSTRAINT `fk_Item_has_Property_Item1` FOREIGN KEY (`idItem`) REFERENCES `item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Item_has_Property_Property1` FOREIGN KEY (`idProperty`) REFERENCES `property` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `itemproperty_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `partage`
--
ALTER TABLE `partage`
  ADD CONSTRAINT `fk_user_has_Slate_Slate1` FOREIGN KEY (`idSlate`) REFERENCES `slate` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_has_Slate_user1` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `slate`
--
ALTER TABLE `slate`
  ADD CONSTRAINT `fk_Slate_Template1` FOREIGN KEY (`idTemplate`) REFERENCES `template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Slate_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `template`
--
ALTER TABLE `template`
  ADD CONSTRAINT `template_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `templateaction`
--
ALTER TABLE `templateaction`
  ADD CONSTRAINT `fk_Template_has_Action_Action1` FOREIGN KEY (`idAction`) REFERENCES `action` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Template_has_Action_Template1` FOREIGN KEY (`idTemplate`) REFERENCES `template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `templateproperty`
--
ALTER TABLE `templateproperty`
  ADD CONSTRAINT `fk_Template_has_Property_Property1` FOREIGN KEY (`idProperty`) REFERENCES `property` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Template_has_Property_Template1` FOREIGN KEY (`idTemplate`) REFERENCES `template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
