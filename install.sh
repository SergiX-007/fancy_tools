#!/usr/bin/env bash
# install.sh - Installation idempotente de fancy_tools
set -e

REPO_URL='https://github.com/SergiX-007/fancy_tools.git'
SRC_DIR="${HOME}/src/fancy_tools"
BACKUP_SUFFIX="$(date +%Y%m%d_%H%M%S)"

# Sauvegarde de .bashrc
if [ -f "${HOME}/.bashrc" ]; then
    cp "${HOME}/.bashrc" "${HOME}/.bashrc.bak.${BACKUP_SUFFIX}"
    echo "Sauvegarde de .bashrc créée : .bashrc.bak.${BACKUP_SUFFIX}"
fi

# Ajout d'une ligne si absente
add_if_missing() {
    grep -qxF "$1" "${HOME}/.bashrc" || echo "$1" >> "${HOME}/.bashrc"
}

# Ajouter les sources
add_if_missing "source ${HOME}/src/fancy_tools/.aliases"
add_if_missing "source ${HOME}/src/fancy_tools/fancy_functions.sh"

# Ajouter ~/bin au PATH si pas déjà présent
if ! grep -q 'export PATH="${HOME}/bin:${PATH}"' "${HOME}/.bashrc"; then
    echo 'export PATH="${HOME}/bin:${PATH}"' >> "${HOME}/.bashrc"
    echo "~/bin ajouté au PATH"
fi

# Cloner le dépôt si absent
if [ ! -d "${SRC_DIR}" ]; then
    mkdir -p "${HOME}/src"
    git clone "${REPO_URL}" "${SRC_DIR}"
    echo "Dépôt cloné dans ${SRC_DIR}"
else
    echo "Dépôt déjà présent dans ${SRC_DIR}, aucune action."
fi

# Copier updateFancyTools dans ~/bin s'il existe
if [ -f "${SRC_DIR}/bin/updateFancyTools" ]; then
    mkdir -p "${HOME}/bin"
    cp "${SRC_DIR}/bin/updateFancyTools" "${HOME}/bin/updateFancyTools"
    chmod +x "${HOME}/bin/updateFancyTools"
    echo "updateFancyTools installé dans ~/bin"
fi

echo "Installation terminée. Ouvrez un nouveau terminal ou sourcez votre .bashrc."
