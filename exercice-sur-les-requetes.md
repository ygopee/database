# Exemples de requetes

## Afficher l'utilisateur dont l'adresse email est : robert@gmail.com

SELECT * FROM users WHERE email = 'robert@gmail.com'

## Afficher l'utilisateur dont le token est : secret1

SELECT * FROM users WHERE token = 'secret1'

## Afficher les pokemons appartenant au joueur : Bob

SELECT *
FROM pokemons, users
WHERE users.name = 'Bob'
AND pokemons.id = users.id

## Afficher les pokemons appartenant au dresseur : Oscar

SELECT *
FROM pokemons, users
WHERE users.name = 'Oscar'
AND pokemons.user_id = users.id

## Afficher toutes les pokemons dont la description commence par : Boo

SELECT * FROM pokemons
WHERE description LIKE "Boo%"

## Afficher toutes les pokemons dont la puissance est egale a : 98

SELECT * FROM pokemons WHERE power = '98'

## Afficher les pokemons dont le nom commence par "moku" et se termine par "ren"

SELECT * FROM pokemons
WHERE name LIKE "moku%"
AND name LIKE "%ren"

## Afficher tous les pokemons qui appartiennent à : alice@gmail.com

SELECT *
FROM pokemons, users
WHERE email = 'alice@gmail.com'

## Afficher toutes les attaques en provenance de : Boo

SELECT * FROM attacks,pokemons
WHERE attacks.src_pokemon_id=pokemons.id
AND pokemons.name="Boo"

## Afficher toutes les attaques à destination de : mokumokuren

SELECT * FROM attacks,pokemons WHERE attacks.dst_pokemon_id=pokemons.id AND pokemons.name="mokumokuren"
