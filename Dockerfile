# Utiliser une image de base légère de python
FROM python:3.12-slim

# Installer Poetry
RUN pip install poetry

#Définir le répértoire de travail
WORKDIR /app

#Copier les fichier poetry et installer les dépendances
COPY pyproject.toml poetry.lock /app/

#Installer les dépendances dans l'environnement virtuel de poetry
RUN poetry config virtualenvs.create false && poetry install --no-dev

#Copier les autres fichier de l'application
COPY . /app

#Exposer le port 8092
EXPOSE 5001

#Définir la commande de démarrage
CMD ["python", "app.py"]