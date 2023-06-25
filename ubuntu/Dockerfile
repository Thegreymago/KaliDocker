# Utilisez l'image de base Ubuntu
FROM ubuntu:latest

# Mettez à jour les packages et installez les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    vim \
    git \
    zsh

WORKDIR /root

# Exécutez des commandes supplémentaires si nécessaire
RUN if [ ! -d "/root/.oh-my-zsh" ]; \
then sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
fi

RUN chsh -s $(which zsh)

# Définissez la commande par défaut à exécuter lorsque le conteneur démarre
CMD ["tail", "-f", "/dev/null"]
