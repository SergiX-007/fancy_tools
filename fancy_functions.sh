#!/usr/bin/env bash
# Fonction gco : commit avec préfixe [branche]

gco() {
    # Vérifier qu'on est dans un dépôt git
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Erreur : vous n'êtes pas dans un dépôt Git." >&2
        return 1
    fi

    # Récupérer le nom de la branche courante
    local branch
    branch=$(git branch --show-current)
    if [ -z "$branch" ]; then
        echo "Erreur : impossible de déterminer la branche courante." >&2
        return 1
    fi

    # Vérifier qu'un message a été fourni
    if [ $# -eq 0 ] || [ -z "$1" ]; then
        echo "Usage : gco 'votre message de commit'"
        echo "Exemple : gco 'ajout de la fonction d'installation'"
        return 1
    fi

    local message="$1"
    git commit -m "[${branch}] ${message}"
}
