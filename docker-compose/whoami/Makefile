all: down up

up:
	docker-compose -f src/docker-compose.yml up

ps:
	docker-compose -f src/docker-compose.yml ps

upd:
	docker-compose -f src/docker-compose.yml up -d

down:
	docker-compose -f src/docker-compose.yml down

test: upd tests down

tests:
	./test/test.sh
