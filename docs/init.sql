-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : mar. 13 sep. 2022 à 21:52
-- Version du serveur : 10.5.8-MariaDB-1:10.5.8+maria~focal
-- Version de PHP : 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `app_db`
--
DROP DATABASE IF EXISTS `app_db`;
CREATE DATABASE IF NOT EXISTS `app_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `app_db`;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user`
(
    `id`       int(11)      NOT NULL AUTO_INCREMENT,
    `email`    varchar(255) NOT NULL,
    `name`     varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    `credit_card_id` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `credit_card_infos`;
CREATE TABLE IF NOT EXISTS `credit_card_infos` (
 `id` int(11) NOT NULL,
 `name` varchar(255) NOT NULL,
 `numbers` varchar(255) NOT NULL,
 `expiration` varchar(255) NOT NULL,
 `type` varchar(255) NOT NULL,
 `code` varchar(255) NOT NULL,
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `user`
    ADD CONSTRAINT `FK_8D93D6497048FD0F` FOREIGN KEY (`credit_card_id`) REFERENCES `credit_card_infos` (`id`);

INSERT INTO `credit_card_infos` (`id`,`name`, `numbers`, `expiration`, `type`, `code`)
VALUES
    (1,'Mouss Tache','4024007196288236','11/22','Visa','123'),
    (2,'Harry Zona','2542608345904909','04/25','MasterCard','345'),
    (3,'Juda Bricot','2328434434779064','09/24','MasterCard','766');

INSERT INTO `user` (`id`, `email`, `name`, `password`,`credit_card_id`)
VALUES
    (1, 'admin@mail.dev', 'Admin', 'password',null),
    (2, 'mouss.tache@mail.dev', 'Mouss Tache', 'password',1),
    (3, 'harry.zona@mail.dev', 'Harry Zona', 'password',2),
    (4, 'judas.bricot@mail.dev', 'Juda Bricot', 'password',3);




/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
