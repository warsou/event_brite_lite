Hello !

Voici le lien vers Heroku : https://aj-thp-eventbrite-project.herokuapp.com/

### Réaliser des tests en local

Se placer dans le dossier `thp-07-02-eventbrite-v2-master`. Installer les gemmes nécessaires (via *Bundler*)
~~~bash
$ cd path/to/thp-07-02-eventbrite-v2-master
$ bundle install
~~~

Construire la BDD
~~~bash
$ rails db:create db:migrate
~~~

Remplir la BDD à partir de `seeds.rb`
~~~bash
$ rails db:seed
~~~

#### Pour voir le front-end en local

Lancer le `serveur rails`
~~~bash
$ rails server
~~~

Visiter le site en local :\
[localhost sur le port 3000](http://localhost:3000/)

#### Pour voir le back-end en local

Lancer la `rails console`
~~~bash
$ rails console
~~~

***

## Configuration requise

Version de **Rails** :
~~~bash
$ rails-v
Rails 5.2.3
~~~

Version de **Ruby** :
~~~bash
$ ruby -v
ruby 2.5.1
~~~

Version de **Bundler** :
~~~bash
$ bundle -v
Bundler version 2.0.2
~~~

Gemmes utilisées (source : *Gemfile*) :\
Gemme décommentée du **Gemfile** de Rails :
~~~ruby
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
~~~

Gemmes ajoutée au groupe `development` du **Gemfile** de Rails :
~~~ruby
group :development do
  ...
  # Enables 'realistic' and 'effortless' seed
  gem 'faker'
  # Displays nice tables in Rails Console
  gem 'table_print'
  # easier-to-read error messages
  gem 'better_errors'
  gem 'binding_of_caller'
  # previews emails in browser instead of actually sending them
  gem "letter_opener"
  # managing credentials
  gem 'dotenv-rails'
end
~~~

Gemmes ajoutées au **Gemfile** de Rails :
~~~ruby
# Use Devise for authentication and user management
gem 'devise'
# jQuery is required for Bootstrap
gem 'jquery'
# Bootstrap for nicer layouts
gem 'bootstrap', '~>v4.3.1'
~~~

