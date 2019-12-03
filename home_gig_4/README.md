## Database creation:
 ### Requirements:
 * Install postgres on your local machine. [Get Postgres](https://postgresapp.com)
 * Install helpful tool called pgAdmin. [Get pgAdmin](https://www.pgadmin.org/download/)
 * Make sure postgres is properly installed in your machine. You can run commands such as `brew install postgresql`
 * Launch postgres
 * For Ubuntu, run `sudo apt-get install libpq-dev` and `sudo apt-get install postgresql`.
 * Execute bundle exec rake db:create


 ## Database initialization:
 * Run `make install-dev`
 * If the above fails, run `gem install pg -v '1.1.4' --source 'https://rubygems.org/'`
 * Alternatively, you can run: `bundle install && yarn install` , followed by `rake db:create && rake db:migrate`
 * Run `Make start` or `rails server` to start the app.

 ## Databse Management:
 * Download and install `pgAdmin` in your machine, and follow this [tutorial](http://www.postgresqltutorial.com/connect-to-postgresql-database/)

 ## PGAmdmin Connection:
 * Login to the Heroku account and navigate to the [Data](https://data.heroku.com/) Menu
 * Click on the DataBase Container and navigate to the `Settings` Menu
 * Under `Administration - Database Credentials` click on `View Credentials`. You'll need those credentials for setting up a connection in `PGAdmin`
 * In `PGAdmin` select `Add New Server`. Under `General` input `home_gig_heroku` for the Name field.
 * Under `Connection`:
    * `Host`: `ec2-184-73-176-11.compute-1.amazonaws.com`
    * `Maintanance/Database`: `d1360lmkpg20el`
    * `Username`: *Look at credentials in Heroku Dashboard
    * `Password`: *Look at credentials in Heroku Dashboard
    * Select `save Password` checkbox
* Finally, Under `Advanced`:
    * `DB Restriction`: d1360lmkpg20el
* Save and create the server
