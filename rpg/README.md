# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#on window after install ruby 2.7.6 and rails
#problem install 

```bash
gem update --system
```

```bash
bundle install
```

#launch project

```bash
ruby bin/rails server
```

```bash
ruby bin/rails db:migrate
```

#Genereate scaffold (MVC)
```bash
rails g scaffold game name:string description string channel:references
```

#Delete scaffold if migration not doing before

```bash
rails destroy scaffold game 
```

#Delete scaffold il migration already done

```bash
rake db:rollback
rails destroy scaffold game
```
