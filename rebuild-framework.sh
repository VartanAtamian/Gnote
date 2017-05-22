#!/bin/sh -ex
#
# http://guides.rubyonrails.org/getting_started.html
# gems => sorcery

websitename='Gnote'
pguser='pguser123'
pgpass='123soleil'

ruby -v
rails --version

# générer le framework local
rm -rf "$websitename"
rails new "$websitename" -d postgresql --skip-git
cp -v .gitignore "$websitename"
rm -v "$websitename"/README.md
cd "$websitename"

# configuration de la BDD
sed -i '/^default: &default$/s/t$/t\n  username: '"$pguser"'\n  password: '"$pgpass"/ config/database.yml

# préparation de la BDD
sudo -u postgres psql <<EOF
DROP DATABASE "${websitename}_development";
DROP DATABASE "${websitename}_production";
DROP DATABASE "${websitename}_test";
\\q
EOF
sudo -u postgres dropuser "$pguser" || :

# création de l'utilisateur de la BDD
sudo -u postgres psql <<EOF
CREATE USER "$pguser" WITH CREATEDB ENCRYPTED PASSWORD '$pgpass';
\\q
EOF
exit
# ajouter les contrôleurs
ruby bin/rails generate controller Welcome index
ruby bin/rails generate controller Users
ruby bin/rails generate controller Disciplines
ruby bin/rails generate controller Exams
ruby bin/rails generate controller Assessments

# ajouter les modèles
ruby bin/rails generate model User \
    email:string \
    firstName:string \
    lastName:string \
    secretHash:string \
    isTeacher:boolean \
    isAdmin:boolean

ruby bin/rails generate model Discipline \
    disciplineTitle:string \
    teacherID:integer \
    startDate:date \
    endDate:date

ruby bin/rails generate model Exam \
    examTitle:string \
    disciplineID:integer \
    examDate:date

ruby bin/rails generate model Assessment \
    examID:integer \
    studentID:integer \
    grade:float

# création et migration de la BDD
ruby bin/rails db:create db:migrate db:seed
