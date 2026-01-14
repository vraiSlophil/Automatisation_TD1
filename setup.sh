#!/bin/bash

# Script d'automatisation pour lancer les trois projets

set -e  # Arrête le script en cas d'erreur

echo "=== Démarrage de l'automatisation ==="
echo ""

# ==========================================
# 1. Configuration immo-admin-react
# ==========================================
echo "### Configuration immo-admin-react ###"
cd immo-admin-react

if [ ! -f .env ]; then
    echo "Création du fichier .env..."
    cp .env.example .env
else
    echo ".env existe déjà"
fi

echo "Installation des dépendances..."
docker compose run --rm immo-admin-react npm ci

cd ..
echo "immo-admin-react configuré"
echo ""

# ==========================================
# 2. Configuration immo-api-php
# ==========================================
echo "### Configuration immo-api-php ###"
cd immo-api-php

if [ ! -f .env ]; then
    echo "Création du fichier .env..."
    cp .env.exemple .env
else
    echo ".env existe déjà"
fi

echo "Installation des dépendances composer..."
docker compose -f ./docker-compose.yaml run --rm immo.api composer install

cd ..
echo "immo-api-php configuré"
echo ""

# ==========================================
# 3. Configuration immo-client-vue
# ==========================================
echo "### Configuration immo-client-vue ###"
cd immo-client-vue

if [ ! -f .env ]; then
    echo "Création du fichier .env..."
    cp .env.exemple .env
else
    echo ".env existe déjà"
fi

echo "Installation des dépendances..."
docker compose run --rm immo-client-vue npm ci

cd ..
echo "immo-client-vue configuré"
echo ""

echo "=== Configuration terminée ==="

# ==========================================
# Lancement des services
# ==========================================
echo "### Lancement des services Docker ==="
echo ""

# Lancer immo-api-php en premier (base de données)
echo "Démarrage de immo-api-php..."
cd immo-api-php
docker compose up -d
cd ..
echo "immo-api-php lancé"
echo ""

# Lancer immo-client-vue
echo "Démarrage de immo-client-vue..."
cd immo-client-vue
docker compose up -d
cd ..
echo "immo-client-vue lancé"
echo ""

# Lancer immo-admin-react
echo "Démarrage de immo-admin-react..."
cd immo-admin-react
docker compose up -d
cd ..
echo "immo-admin-react lancé"
echo ""

echo "=== Tous les services sont lancés ==="
echo ""
echo "Accès aux applications:"
echo "  - immo-admin-react: http://localhost:3001"
echo "  - immo-api-php: http://localhost:6080"
echo "  - immo-client-vue: http://localhost:3000"
echo "  - Adminer (DB): http://localhost:8080"
