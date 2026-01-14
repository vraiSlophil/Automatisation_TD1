## Marche à suivre pour lancer le projet

1. Copier le .env.example en .env et ajuster les variables d'environnement si nécessaire :
    ```bash
    cp .env.example .env
    ```

2. Installer les dépendances :
    ```bash
    docker compose run --rm immo-admin-react npm ci
    ```

3. Lancer le projet :
    ```bash
    docker compose up
    ```

4. Ouvrir votre navigateur et accéder à l'application à l'adresse suivante :
    
    https://localhost:3001