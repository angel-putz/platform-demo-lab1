FROM node:18.16.0-alpine3.18

WORKDIR /app

# Copie le lockfile pour verrouiller les versions exactes
COPY package*.json ./

# Installation propre des dépendances
RUN npm ci

# Copie du reste du code source
COPY . .

# Exécution des tests pendant le build (échoue et annule le build si un test casse)
RUN npm test

EXPOSE 3000

# Commande de démarrage de l'application
CMD ["npm", "start"]