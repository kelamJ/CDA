-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 30 août 2023 à 12:05
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `BddTP02`
--

-- --------------------------------------------------------

--
-- Structure de la table `Chambre`
--

CREATE TABLE `Chambre` (
  `num_ch` int(11) NOT NULL,
  `capacité_ch` int(11) DEFAULT NULL,
  `confort_ch` decimal(4,2) DEFAULT NULL,
  `exposition_ch` varchar(50) DEFAULT NULL,
  `type_ch` varchar(50) DEFAULT NULL,
  `num_h` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `num_cli` int(11) NOT NULL,
  `adresse_cli` varchar(50) DEFAULT NULL,
  `nom_cli` varchar(50) DEFAULT NULL,
  `prenom_cli` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Hotel`
--

CREATE TABLE `Hotel` (
  `num_h` int(11) NOT NULL,
  `capacite_h` int(11) DEFAULT NULL,
  `categorie_h` varchar(50) DEFAULT NULL,
  `nom_h` varchar(50) DEFAULT NULL,
  `adresse_h` varchar(50) DEFAULT NULL,
  `num_sta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Reservation`
--

CREATE TABLE `Reservation` (
  `num_ch` int(11) NOT NULL,
  `num_cli` int(11) NOT NULL,
  `date_debut_res` date DEFAULT NULL,
  `date_fin_res` date DEFAULT NULL,
  `date_res` date DEFAULT NULL,
  `montant_acompte_res` decimal(4,2) DEFAULT NULL,
  `prix_total_res` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Station`
--

CREATE TABLE `Station` (
  `num_sta` int(11) NOT NULL,
  `nom_sta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Chambre`
--
ALTER TABLE `Chambre`
  ADD PRIMARY KEY (`num_ch`),
  ADD KEY `num_h` (`num_h`);

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`num_cli`);

--
-- Index pour la table `Hotel`
--
ALTER TABLE `Hotel`
  ADD PRIMARY KEY (`num_h`),
  ADD KEY `num_sta` (`num_sta`);

--
-- Index pour la table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`num_ch`,`num_cli`),
  ADD KEY `num_cli` (`num_cli`);

--
-- Index pour la table `Station`
--
ALTER TABLE `Station`
  ADD PRIMARY KEY (`num_sta`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Client`
--
ALTER TABLE `Client`
  MODIFY `num_cli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Hotel`
--
ALTER TABLE `Hotel`
  MODIFY `num_h` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Station`
--
ALTER TABLE `Station`
  MODIFY `num_sta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Chambre`
--
ALTER TABLE `Chambre`
  ADD CONSTRAINT `Chambre_ibfk_1` FOREIGN KEY (`num_h`) REFERENCES `Hotel` (`num_h`);

--
-- Contraintes pour la table `Hotel`
--
ALTER TABLE `Hotel`
  ADD CONSTRAINT `Hotel_ibfk_1` FOREIGN KEY (`num_sta`) REFERENCES `Station` (`num_sta`);

--
-- Contraintes pour la table `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`num_ch`) REFERENCES `Chambre` (`num_ch`),
  ADD CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`num_cli`) REFERENCES `Client` (`num_cli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
