init-db:
	@docker-compose exec app flask db init

migrate-db:
	@docker-compose exec app flask db migrate -m "Initial migration"

upgrade-db:
	@docker-compose exec app flask db upgrade

run:
	@docker-compose up -d --build

logs:
	@docker-compose logs -f app

down:
	@docker-compose down