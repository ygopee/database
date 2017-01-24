-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 25 Janvier 2017 à 00:08
-- Version du serveur :  5.5.42
-- Version de PHP :  7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `battle-go`
--

-- --------------------------------------------------------

--
-- Structure de la table `attacks`
--

CREATE TABLE `attacks` (
  `id` int(11) NOT NULL,
  `src_pokemon_id` int(11) NOT NULL,
  `dst_pokemon_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pokemons`
--

CREATE TABLE `pokemons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `live` tinyint(3) unsigned NOT NULL,
  `power` tinyint(3) unsigned NOT NULL,
  `speed` tinyint(3) unsigned NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pokemons`
--

INSERT INTO `pokemons` (`id`, `name`, `description`, `live`, `power`, `speed`, `image_url`, `user_id`) VALUES
(1, 'boo', 'Boo is strong.', 1, 98, 1, 'http://www.ufunk.net/wp-content/uploads/2010/06/Bakemono-Zukushi-Japanese-monsters-12.jpg', 1),
(2, 'mokumokuren', 'Spirit that usually live in torn shoji.', 33, 33, 33, 'http://vignette4.wikia.nocookie.net/l5r/images/2/2b/Mokumokuren.jpg/revision/latest?cb=20101117204816', 3);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `token`, `name`) VALUES
(1, 'bob@gmail.com', 'secret', 'secret1', 'Bob'),
(2, 'alice@gmail.com', 'secret', 'secret2', 'Alice'),
(3, 'oscar@gmail.com', 'secret', 'secret3', 'Oscar');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `attacks`
--
ALTER TABLE `attacks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `src_pokemon_id_2` (`src_pokemon_id`,`created_at`),
  ADD KEY `src_pokemon_id` (`src_pokemon_id`),
  ADD KEY `dst_pokemon_id` (`dst_pokemon_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Index pour la table `pokemons`
--
ALTER TABLE `pokemons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `image_url` (`image_url`),
  ADD KEY `speed` (`speed`),
  ADD KEY `live` (`live`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `power` (`power`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `token` (`token`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `attacks`
--
ALTER TABLE `attacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `pokemons`
--
ALTER TABLE `pokemons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `attacks`
--
ALTER TABLE `attacks`
  ADD CONSTRAINT `attacks_ibfk_1` FOREIGN KEY (`src_pokemon_id`) REFERENCES `pokemons` (`id`),
  ADD CONSTRAINT `attacks_ibfk_2` FOREIGN KEY (`dst_pokemon_id`) REFERENCES `pokemons` (`id`);

--
-- Contraintes pour la table `pokemons`
--
ALTER TABLE `pokemons`
  ADD CONSTRAINT `pokemons_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
