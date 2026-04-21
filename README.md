# fancy_tools - Outils shell pratiques

## Description
Ce projet fournit une collection d'alias et de fonctions pour simplifier l'utilisation quotidienne de Git en ligne de commande.

## Prérequis
- Système d'exploitation : Linux / macOS / WSL
- Git installé
- Bash comme shell par défaut

## Installation
1. Cloner le dépôt :
   ```
   git clone https://github.com/SergiX-007/fancy_tools.git
   cd fancy_tools
   ```
2. Lancer le script d'installation :
   ```
   bash install.sh
   ```
3. Ouvrir un nouveau terminal ou exécuter `source ~/.bashrc`

## Utilisation
| Commande | Équivalent Git                     |
|----------|------------------------------------|
| `gss`    | `git status`                       |
| `gpl`    | `git pull`                         |
| `gpu`    | `git push`                         |
| `gap`    | `git add .`                        |
| `gco 'msg'` | Commit avec préfixe [branche] msg |

Exemple :
```
$ gco 'correction du bug d'affichage'
# => git commit -m '[dev] correction du bug d'affichage'
```

## Structure du projet
```
fancy_tools/
├── .aliases              # Alias shell pour Git
├── fancy_functions.sh    # Fonction gco
├── install.sh            # Script d'installation idempotent
├── bin/
│   └── updateFancyTools  # Script de mise à jour
└── README.md
```
