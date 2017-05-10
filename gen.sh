#!/bin/sh

site='Gnote'

# générer le framework local
#rails new "$site"
#cd "$site"
exit

# ajouter un contrôleur
./bin/rails generate controller Welcome index
./bin/rails generate controller Users

# ajouter un modèle
./bin/rails generate model User title:string text:text



./bin/rails db:migrate







