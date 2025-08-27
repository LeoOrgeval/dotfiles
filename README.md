# Mes dotfiles

Contient les fichiers de configuration pour mon environnement de développement.

## Installation (macOS)

### 1. Installer Homebrew
Homebrew est le gestionnaire de paquets de macOS.  
Exécute cette commande dans ton terminal :

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Cloner le dépôt et lancer l'installation
```bash
# Cloner le dépôt
git clone https://github.com/leoorgeval/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh

# Changer la remote url pour utiliser SSH
git remote delete origin
git remote add origin git@github.com:leoorgeval/dotfiles.git
```

## Mise à jour
Si tu souhaites mettre à jour tes dotfiles, exécute les commandes suivantes :

```bash
cd ~/dotfiles
gpl # git pull
chmod +x install.sh
./install.sh
```

## Vérification
Pour vérifier que tout fonctionne correctement, tu peux exécuter les commandes suivantes :

```bash
# Vérifier la version de Starship
starship --version
# Vérifier la version de Zsh
zsh --version
# Vérifier la config de Git
which git
git --version
git config --global --list
```