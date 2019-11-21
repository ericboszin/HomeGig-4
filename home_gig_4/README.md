# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Database creation:
 ### Requirements:
 * Install postgres on your local machine. [Get Postgres](https://postgresapp.com)
 * Install helpful tool called pgAdmin. [Get pgAdmin](https://www.pgadmin.org/download/)
 * Make sure postgres is properly installed in your machine. You can run commands such as "brew install postgresql"
 * For Ubuntu, run `sudo apt-get install libpq-dev` and `sudo apt-get install postgresql`.

 ## Database initialization:
 * Run Make install-dev
 * Alternatively, you can run: `bundle install && yarn install` , followed by "rake db:create && rake db:migrate"
 * Run `Make start` or `rails server` to start the app.

 ## Databse Management:
 * Download and install `pgAdmin` in your machine, and follow this [tutorial](http://www.postgresqltutorial.com/connect-to-postgresql-database/) 