# Gestionnaire de notes pour enseignants

- Un visiteur doit s'authentifier sur le site
- Un visiteur peut s'inscrire sur le site mais son compte doit être activé par un administrateur
- Un utilisateur inscrit dont le compte a été validé par un administrateur est un enseignant
- Un enseignant peut ajouter une épreuve à sa liste d'épreuve
- Un enseignant peut ajouter une matière à sa liste de matières
- Une matière est caractérisée par un titre et une période de temps (début et fin des interventions)
- Une épreuve est caractérisée par un titre et une date d'examen
- Une matière est constituée d'une ou plusieurs épreuves
- Un matière concerne une liste d'étudiants
- Un enseignant peut saisir les notes des étudiants
- Un étudiant peut consulter les épreuves auxquels il a participé
- Pour chaque épreuve, un étudiant peut consulter sa note
- Un étudiant est un utilisateur authentifié
- Un étudiant ne peut pas s'inscrire
- Un étudiant devra être être invité par un enseignant pour pouvoir s'identifier
- Un enseignant peut inviter un étudiant en précisant son nom, son prénom et son adresse email
- Lorsqu'un enseignant invite un étudiant, ce dernier reçoit une invitation par email



## Création de la base de données PostgreSQL

```sh
$ sudo -u postgres psql
create user <username> with password '<yourawesomepassword>';
create database "Gnote_development" owner <username>;
```
