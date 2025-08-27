#!/bin/bash

# Script d'installation complète des dotfiles et applications
set -e

echo "🚀 Installation complète de l'environnement de développement..."

# Vérifier si Homebrew est installé
if ! command -v brew &> /dev/null; then
    echo "📦 Installation de Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Ajouter Homebrew au PATH pour cette session
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Installer toutes les applications depuis le Brewfile
if [ -f "Brewfile" ]; then
    echo "📱 Installation des applications depuis Brewfile..."
    brew bundle install --file=Brewfile
else
    echo "⚠️  Brewfile non trouvé..."
fi

# Créer les liens symboliques
echo "🔗 Création des liens symboliques..."
stow . --adopt

# Vérifier si le dossier .ssh existe et configurer les permissions
if [ -d ~/.ssh ]; then
    echo "🔐 Configuration des permissions SSH..."
    chmod 700 ~/.ssh

    if [ -f ~/.ssh/config ]; then
        chmod 600 ~/.ssh/config
        echo "✅ Permissions SSH configurées"
    fi
else
    echo "⚠️  Le dossier .ssh n'existe pas encore"
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
fi

# Configuration de NVM et Node.js
echo "🟢 Configuration de NVM et Node.js..."
export NVM_DIR="$HOME/.nvm"

# Créer le répertoire NVM s'il n'existe pas
[ ! -d "$NVM_DIR" ] && mkdir -p "$NVM_DIR"

# Charger NVM
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
    source "/opt/homebrew/opt/nvm/nvm.sh"
    source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

    # Installer et utiliser la version LTS de Node.js
    echo "📦 Installation de Node.js LTS..."
    nvm install --lts
    nvm use --lts
    nvm alias default node

    echo "✅ Node.js $(node --version) installé et configuré"

    # Installation des paquets globaux
    echo "📦 Installation des paquets globaux Node.js..."
    npm install -g pnpm eslint prettier
else
    echo "⚠️  NVM non trouvé, redémarrez votre terminal et lancez 'nvm install --lts'"
fi

# Charger les paramètres MacOS
echo "🍏 Configuration des paramètres MacOS..."
chmod +x ~/.macos
# source ~/.macos || echo "ℹ️  Exécutez manuellement 'source ~/.macos' pour appliquer les paramètres"

echo ""
echo "🎉 Installation terminée !"
echo ""
echo "📝 Prochaines étapes :"
echo "  - Redémarrez votre terminal"
echo "  - Connectez-vous au Mac App Store pour WhatsApp"
echo "  - Activez l'agent SSH dans 1Password: Préférences → Développeurs → Intégration SSH/GPG"
echo "  - Connectez-vous à 1Password via 'op signin'"
echo "  - Vérifiez Node.js: node --version"
echo "  - Vérifiez la config Git: git config --global --list"
echo "  - Vérifiez la config SSH: ssh-add -L"
echo "  - Testez GitHub: ssh -T git@github.com"
echo ""
echo "🚀 Applications installées :"
echo "  • OrbStack (Docker)"
echo "  • Warp (Terminal)"
echo "  • VS Code"
echo "  • Spotify"
echo "  • Notion"
echo "  • Discord"
echo "  • Tailscale"
echo "  • WhatsApp"
echo "  • 1Password + CLI (avec agent SSH)"
