#!/bin/sh -ex
#
# http://guides.rubyonrails.org/getting_started.html
# gems => sorcery

websitename='Gnote'
idtype='primary_key' # smallserial
pguser='pguser123'
pgpass='123soleil'

ruby -v
rails --version

# générer le framework local
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
sleep 5
ruby bin/rails generate controller Welcome index
ruby bin/rails generate controller Users
ruby bin/rails generate controller Disciplines
ruby bin/rails generate controller Exams
ruby bin/rails generate controller Assessments

# ajouter les modèles
ruby bin/rails generate model User \
    userId:"$idtype" \
    firstName:string \
    lastName:string \
    email:string \
    secretHash:string \
    teacher:boolean \
    admin:boolean

ruby bin/rails generate model Discipline \
    disciplineId:"$idtype" \
    title:string \
    startDate:date \
    endDate:date

ruby bin/rails generate model Exam \
    examId:"$idtype" \
    examDate:date

ruby bin/rails generate model Assessment \
    assessmentId:"$idtype" \
    grade:float

# création et migration de la BDD
sleep 5
ruby bin/rails db:drop
sleep 5
ruby bin/rails db:create
sleep 5
ruby bin/rails db:migrate
