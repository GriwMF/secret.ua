# README

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

#### Install Docker environment

* `brew tap caskroom/cask && brew update && brew cask install virtualbox`
* `brew install docker docker-compose docker-machine`
* If the previous command returned that you've already have them installed: `brew upgrade docker docker-compose docker-machine`

#### Provision a VM for running the project

* `docker-machine create --driver virtualbox --virtualbox-memory 2048 --virtualbox-disk-size 20000 perecup`
* `eval "$(docker-machine env perecup | tee -a ~/.bash_profile)"`
* `sudo bash -c "echo \"$(docker-machine ip perecup)	local.perecup.com.ua\" >> /etc/hosts"`

#### Build the containers

* `docker-compose build web`

#### Seed the database

* `docker-compose run --rm web rake db:create db:migrate db:seed`

#### Running the application

* Start: `docker-compose up [__SERVICE__]`
* Stop: `docker-compose stop [__SERVICE__]`
* Restart: `docker-compose stop [__SERVICE__] && docker-compose start [__SERVICE__]`

Access the application at http://local.perecup.com.ua:3000

#### Deploying changes

When you make changes to your app code, you’ll need to rebuild your image and recreate your app’s containers. To redeploy a service called web, you would use:

`$ docker-compose build web`
`$ docker-compose up --no-deps -d web`
The --no-deps flag prevents Compose from also recreating any services which web depends on.

For a production-like environment, run the same commands with the extra flags `-f docker-compose.yml -f docker-compose.production.yml`, like so:

* Start: `docker-compose -f docker-compose.yml -f docker-compose.production.yml up __SERVICE__`
* Stop: `docker-compose -f docker-compose.yml -f docker-compose.production.yml stop __SERVICE__`
* Restart: `docker-compose -f docker-compose.yml -f docker-compose.production.yml stop __SERVICE__ && docker-compose start __SERVICE__`

#### Performing a database migration

`docker-compose run --rm web rake db:migrate`

On a production-like environment:

`docker-compose -f docker-compose.yml -f docker-compose.production.yml run --rm web rake db:migrate`

#### Accessing postgresql with psql

`docker exec -it name_db_1 psql -U postgres`

Or directly from your host:

`psql postgres://postgres@local.perecup.com.ua`

Navicat should be able to connect to this address.

#### Operations that require restart

* Updating the Gemfile
* Changing config files/environment variables
* Database migrations

#### Running RSpec

`docker-compose run --rm -e RAILS_ENV=test web bundle exec rspec`

### Deployment instructions

Do your best

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact
