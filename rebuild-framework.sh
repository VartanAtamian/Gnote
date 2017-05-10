#!/bin/sh
#
# http://guides.rubyonrails.org/getting_started.html
# gems => sorcery

websitename='Gnote'
idtype='smallserial' # primary_key

ruby -v
rails --version
exit

# générer le framework local
rails new "$websitename" -d postgresql
cd "$websitename"

# ajouter les contrôleurs
./bin/rails generate controller Welcome index
./bin/rails generate controller Users
./bin/rails generate controller Disciplines
./bin/rails generate controller Exams
./bin/rails generate controller Assessments

# ajouter les modèles
./bin/rails generate model User \
userId:"$idtype" \
firstName:string \
lastName:string \
email:string \
secretHash:string \
teacher:boolean \
admin:boolean

./bin/rails generate model Discipline \
disciplineId:"$idtype" \
title:string \
startDate:date \
endDate:date

./bin/rails generate model Exam \
examId:"$idtype" \
examDate:date

./bin/rails generate model Assessment \
assessmentId:"$idtype" \
grade:real

# migration de la base de données
./bin/rails db:migrate
