-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mer. 30 août 2023 à 15:13
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
-- Base de données : `Papyrus`
--

-- --------------------------------------------------------

--
-- Structure de la table `Entcom`
--

CREATE TABLE `Entcom` (
  `numcom` int(11) NOT NULL,
  `obscom` varchar(50) DEFAULT NULL,
  `datcom` date NOT NULL,
  `numfou` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Fournisseur`
--

CREATE TABLE `Fournisseur` (
  `numfou` smallint(6) NOT NULL,
  `nomfou` varchar(25) NOT NULL,
  `ruefou` varchar(50) NOT NULL,
  `posfou` char(5) NOT NULL,
  `vilfou` varchar(30) NOT NULL,
  `confou` varchar(15) NOT NULL,
  `satisf` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Ligcom`
--

CREATE TABLE `Ligcom` (
  `numlig` smallint(6) NOT NULL,
  `qtecde` int(11) DEFAULT NULL,
  `priuni` decimal(9,2) DEFAULT NULL,
  `derliv` date DEFAULT NULL,
  `numcom` int(11) NOT NULL,
  `codart` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE `Produit` (
  `codart` char(4) NOT NULL,
  `libart` varchar(30) NOT NULL,
  `stkale` int(11) NOT NULL,
  `stkphy` int(11) NOT NULL,
  `qteann` int(11) NOT NULL,
  `unimes` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Vente`
--

CREATE TABLE `Vente` (
  `codart` char(4) NOT NULL,
  `numfou` smallint(6) NOT NULL,
  `delliv` smallint(6) NOT NULL,
  `qte1` int(11) NOT NULL,
  `prix1` decimal(9,2) NOT NULL,
  `qte2` int(11) DEFAULT NULL,
  `prix2` decimal(9,2) DEFAULT NULL,
  `qte3` int(11) DEFAULT NULL,
  `prix3` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Entcom`
--
ALTER TABLE `Entcom`
  ADD PRIMARY KEY (`numcom`),
  ADD UNIQUE KEY `Fourninum` (`numfou`);

--
-- Index pour la table `Fournisseur`
--
ALTER TABLE `Fournisseur`
  ADD PRIMARY KEY (`numfou`);

--
-- Index pour la table `Ligcom`
--
ALTER TABLE `Ligcom`
  ADD PRIMARY KEY (`numlig`),
  ADD KEY `numcom` (`numcom`),
  ADD KEY `codart` (`codart`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`codart`);

--
-- Index pour la table `Vente`
--
ALTER TABLE `Vente`
  ADD PRIMARY KEY (`codart`,`numfou`),
  ADD KEY `numfou` (`numfou`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Entcom`
--
ALTER TABLE `Entcom`
  MODIFY `numcom` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Entcom`
--
ALTER TABLE `Entcom`
  ADD CONSTRAINT `Entcom_ibfk_1` FOREIGN KEY (`numfou`) REFERENCES `Fournisseur` (`numfou`);

--
-- Contraintes pour la table `Ligcom`
--
ALTER TABLE `Ligcom`
  ADD CONSTRAINT `Ligcom_ibfk_1` FOREIGN KEY (`numcom`) REFERENCES `Entcom` (`numcom`),
  ADD CONSTRAINT `Ligcom_ibfk_2` FOREIGN KEY (`codart`) REFERENCES `Produit` (`codart`);

--
-- Contraintes pour la table `Vente`
--
ALTER TABLE `Vente`
  ADD CONSTRAINT `Vente_ibfk_1` FOREIGN KEY (`codart`) REFERENCES `Produit` (`codart`),
  ADD CONSTRAINT `Vente_ibfk_2` FOREIGN KEY (`numfou`) REFERENCES `Fournisseur` (`numfou`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
