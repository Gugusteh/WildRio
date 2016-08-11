-- phpMyAdmin SQL Dump
-- version 4.6.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost
-- Généré le :  Jeu 11 Août 2016 à 16:46
-- Version du serveur :  5.7.13-0ubuntu0.16.04.2
-- Version de PHP :  7.0.8-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `exam`
--

-- --------------------------------------------------------

--
-- Structure de la table `athlete`
--

CREATE TABLE `athlete` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `epreuve_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `athlete`
--

INSERT INTO `athlete` (`id`, `name`, `epreuve_id`) VALUES
(1, 'dosette', 3),
(2, 'dos. masterflex', 1),
(3, 'patafix', 1),
(4, 'Kappa', 1);

-- --------------------------------------------------------

--
-- Structure de la table `count_votes`
--

CREATE TABLE `count_votes` (
  `id` int(11) NOT NULL,
  `idepreuve` int(11) DEFAULT NULL,
  `idathlete` int(11) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `count_votes`
--

INSERT INTO `count_votes` (`id`, `idepreuve`, `idathlete`, `votes`) VALUES
(1, 1, 2, 1),
(2, 1, 3, 3),
(3, 3, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

CREATE TABLE `epreuve` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `epreuve`
--

INSERT INTO `epreuve` (`id`, `name`, `description`, `date`) VALUES
(1, 'epreuve1', 'test', '2016-08-01 00:00:00'),
(3, 'epreuve3', 'test3', '2011-01-01 00:00:00'),
(4, 'epreuve4', 'test4', '2017-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, 'test', 'test', 'test@gmail.com', 'test@gmail.com', 1, 'dyi018k3ic0800cggkks0wss8k8g0k0', '$2y$13$dyi018k3ic0800cggkks0uEL7wIB35GHKmGdJfGvmrgoydY92SeZS', '2016-08-11 16:33:21', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(2, 'test1', 'test1', 'test1@test.test', 'test1@test.test', 1, 'sluszm8dno08cgo4sk8808ok4004s8o', '$2y$13$sluszm8dno08cgo4sk880ujl1ZKaHD.2Da2vWdZo72EvFuve3snE.', '2016-08-11 14:44:23', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(3, 'test2', 'test2', 'test2@test.test', 'test2@test.test', 1, '9ckerck2hiwwsg04kwcg4sk8c08c8s0', '$2y$13$9ckerck2hiwwsg04kwcg4eHpx6StlcVkCO/Cn1/DuuUHJbZj1GkVG', '2016-08-11 14:45:45', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(4, 'test3', 'test3', 'test3@test.test', 'test3@test.test', 1, 'js7hzmkj2dsccs8wo88gwgo4w4kg08k', '$2y$13$js7hzmkj2dsccs8wo88gwezp8Asb1f1k4Plf5FU8T6jqkbVsViEyu', '2016-08-11 16:27:48', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `iduser` int(11) DEFAULT NULL,
  `idepreuve` int(11) DEFAULT NULL,
  `idathlete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `votes`
--

INSERT INTO `votes` (`id`, `iduser`, `idepreuve`, `idathlete`) VALUES
(6, 1, 1, 2),
(7, 2, 1, 3),
(8, 3, 1, 3),
(9, 3, 3, 1),
(10, 1, 3, 1),
(11, 4, 1, 3);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `athlete`
--
ALTER TABLE `athlete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C03B8321AB990336` (`epreuve_id`);

--
-- Index pour la table `count_votes`
--
ALTER TABLE `count_votes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`);

--
-- Index pour la table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `athlete`
--
ALTER TABLE `athlete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `count_votes`
--
ALTER TABLE `count_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `epreuve`
--
ALTER TABLE `epreuve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `athlete`
--
ALTER TABLE `athlete`
  ADD CONSTRAINT `FK_C03B8321AB990336` FOREIGN KEY (`epreuve_id`) REFERENCES `epreuve` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
