-- SQL Dump pour le projet de gestion des animaux
-- Version: 1.0
-- Auteur(s): RACHID Ahmed, AMHEND Youness, AMHEND Youssef, HAMRAOUI Oussama, étudiants GI ENSAO
-- Créé le : dim. 29 décembre 2024
-- Ceci est une base de données pour un systeme d'achat d'articles pour animaux.

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Configuration encodage
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- 
-- Base de données : `animal_shop_2024`
-- 

-- --------------------------------------------------------

-- 
-- Structure de la table `purchase`
-- Cette table contient les information des achats effectuer par les utilisateur.
-- 

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE IF NOT EXISTS `purchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- 
-- Données de la table `purchase`
-- Quelques enregistrement pour tester le system
-- 

INSERT INTO `purchase` (`purchase_id`, `client_id`, `article_id`) VALUES
(1, 2, 10),
(2, 1, 20),
(3, 3, 15),
(4, 1, 30);

-- --------------------------------------------------------

-- 
-- Structure de la table `articles`
-- Cette table contient tout les produits et animaux
-- 

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `prix` double NOT NULL,
  `nom` varchar(50) NOT NULL,
  `special` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `new` tinyint(1) NOT NULL,
  PRIMARY KEY (`article_id`),
  KEY `fk_categorie` (`categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Données de la table `articles`
-- Ajout des donnée pour verifier les fonctionnalités.
-- 

INSERT INTO `articles` (`article_id`, `description`, `categorie_id`, `photo`, `status`, `prix`, `nom`, `special`, `featured`, `new`) VALUES
(1, 'Bol en acier pour chiens, avec antidérapant - 30cm', 1, 'dog1.png', 'promo', 50.99, 'Bol acier', 0, 0, 0),
(2, 'Cage rétro pour oiseaux, en métal avec base en bois.', 2, 'cat2.png', 'nouveau', 100.99, 'Cage Retro Bois', 1, 0, 1),
(3, 'Nourriture complète pour chiens de grandes tailles.', 3, 'dog3.png', 'disponible', 80.99, 'Nourriture Chiens', 0, 1, 0),
(4, 'Chat siamois, idéal pour les familles.', 4, 'cat4.png', 'nouveau', 200.00, 'Chat Siamois', 0, 1, 1),
(5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 2, 'dog5.jpg', 'free', 99, 'Pet5', 1, 0, 0),
(6, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 1, 'cat6.jpg', 'free', 59, 'Pet6', 1, 0, 1),
(7, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 3, 'dog7.jpg', 'promo', 47, 'Pet7', 0, 1, 0),
(8, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 2, 'chat1.jpg', 'promo', 20, 'Pet8', 0, 1, 1),
(9, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 3, 'chien1.jpg', 'free', 8, 'Pet9', 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Structure de la table `categories`
-- Contient les différentes catégories d'articles
-- 

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categorie_id` int(11) NOT NULL,
  `nom_categorie` varchar(50) NOT NULL,
  PRIMARY KEY (`categorie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Données de la table `categories`
-- Ajout des catégories disponible.
-- 

INSERT INTO `categories` (`categorie_id`, `nom_categorie`) VALUES
(1, 'Accessoires'),
(2, 'Cages'),
(3, 'Alimentation'),
(4, 'Chats');

-- --------------------------------------------------------

-- 
-- Structure de la table `clients`
-- Contient les données des utilisateurs
-- 

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `societe` varchar(100) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- 
-- Données de la table `clients`
-- Données pour tester les fonctionnalités d'utilisateur.
-- 

INSERT INTO `clients` (`client_id`, `pseudo`, `mot_de_passe`, `email`, `telephone`, `societe`, `adresse`) VALUES
(1, 'etudiant_1', 'password123', 'etudiant1@example.com', '0612345678', 'ENS', 'Rue A, Oujda'),
(2, 'etudiant_2', 'password456', 'etudiant2@example.com', '0612345679', 'ENS', 'Rue B, Oujda'),
(3, 'etudiant_3', 'password789', 'etudiant3@example.com', '0612345680', 'ENS', 'Rue C, Oujda');

-- 
-- Contraintes pour les tables
-- Ajout des contraintes pour maintenir l'intégrité des données
-- 

ALTER TABLE `articles`
  ADD CONSTRAINT `fk_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`categorie_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
