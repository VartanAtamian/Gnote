#!/bin/sh -ex
#
# http://guides.rubyonrails.org/getting_started.html
# gems => sorcery

websitename='Gnote'
idtype='primary_key' # smallserial
pguser='pguser123'
pgpass='123soleil'

eval "$(rbenv init -)"
ruby -v
rails --version

# générer le framework local
rails new "$websitename" -d postgresql --skip-git
cp -v .gitignore "$websitename"
rm -v "$websitename"/README.md
cd "$websitename"

# configuration de la BDD
sed -i 's/^\(.*\)#\(username:\).*$/\1\2 '"$pguser"/ config/database.yml
sed -i 's/^\(.*\)#\(password:\).*$/\1\2 '"$pgpass"/ config/database.yml

# préparation de la BDD
sudo -u postgres psql <<EOF
DROP DATABASE "${websitename}_development";
DROP DATABASE "${websitename}_test";
\\q
EOF
sudo -u postgres dropuser "$pguser" || :

# création de la BDD
sudo -u postgres psql <<EOF
CREATE USER "$pguser" WITH CREATEDB ENCRYPTED PASSWORD '$pgpass';
\\q
EOF

# ajouter les contrôleurs
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
    grade:real

# création et migration de la BDD
#ruby bin/rails db:create db:migrate
