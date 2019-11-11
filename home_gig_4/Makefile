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