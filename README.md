# my_tabletop_rpg

tuto avec rbenv :
https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04

install ruby v 2.7.6
install rails v7.0.0

creer un projet:
rails new le-nom-du-projet

lancer le server:
bin/rails server

aller voir là https://guides.rubyonrails.org/getting_started.html
pour la creation de nouveau controllers et autres éléments


créer un nouveau controller avec views (retirer l'option --skip-routes si la route n'est pas déjà créée)

bin/rails generate controller Articles index --skip-routes

créer un nouveau Model: 

bin/rails generate model Article title:string body:text


annuler un "rail generate": 

bin/rails destroy controller lalala
bin/rails destroy model yadayada
bin/rails destroy scaffold hohoho
