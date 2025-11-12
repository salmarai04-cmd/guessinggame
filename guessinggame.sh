#!/bin/bash

# Fonction pour compter le nombre de fichiers
count_files() {
    local num_files
    num_files=$(ls -1 | wc -l)
    echo $num_files
}

# Fonction pour demander à l'utilisateur de deviner
guess_number() {
    local target=$1
    local guess

    while true; do
        read -p "Devinez combien de fichiers se trouvent dans le répertoire actuel: " guess
        
        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Veuillez entrer un nombre valide."
            continue
        fi

        if [ "$guess" -lt "$target" ]; then
            echo "Trop bas. Essayez encore."
        elif [ "$guess" -gt "$target" ]; then
            echo "Trop haut. Essayez encore."
        else
            echo "Félicitations ! Vous avez deviné le bon nombre de fichiers."
            break
        fi
    done
}

# Programme principal
main() {
    local total_files
    total_files=$(count_files)
    guess_number "$total_files"
}

main
