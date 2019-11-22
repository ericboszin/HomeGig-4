# install dependencies dev-enviroment
install-dev:
	bundle install && yarn install && make migrate

migrate:
	rails db:migrate RAILS_ENV=development

make start:
	rails server

# start https server
make start-secure:
	rails s -b 'ssl://localhost:3000?key=config/localhost.key&cert=config/localhost.crt'

### Adding heroku deployment commands:
make heroku-login:
	heroku login

### Link repository to heroku:
make heroku-link-repo:
	heroku git:remote -a home-gig-4

### deploys master branch /home_gig_4 directory only
make heroku-deploy:
	cd .. && git subtree push --prefix home_gig_4 heroku master

### runs db migration inside heroku cluster
make heroku-migrate:
	heroku run rake db:migrate

### done only once to set servers master key
make heroku-set-masterkey:
	heroku config:set RAILS_MASTER_KEY=`cat config/master.key`