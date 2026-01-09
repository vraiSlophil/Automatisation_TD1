# immo-client-vue - Installation et Lancement

## Prérequis

- L'application Docker Desktop installé + connection

## Configuration

Créer un fichier `.env` à la racine du projet :

VITE_API_URL=http://localhost:8080
VITE_PORT={PORT} (par exemple 3000)

## Lancement du projet

`docker compose run --rm immo-client-vue npm ci`

## Puis
`docker compose up`

## Le projet est accessible sur `http://localhost:3000`