PROJECT_NAME := kp-lite
COMPOSE := docker compose
COMPOSE_FILE := compose.yaml

up:
	$(COMPOSE) -f $(COMPOSE_FILE) up -d

down:
	$(COMPOSE) -f $(COMPOSE_FILE) down

restart:
	$(MAKE) down
	$(MAKE) up

logs:
	$(COMPOSE) -f $(COMPOSE_FILE) logs -f

build:
	$(COMPOSE) -f $(COMPOSE_FILE) build

ps:
	$(COMPOSE) -f $(COMPOSE_FILE) ps

exec:
	@echo "Usage: make exec SERVICE=name"
	@$(COMPOSE) -f $(COMPOSE_FILE) exec $(SERVICE) sh

bash:
	@echo "Usage: make bash SERVICE=name"
	@$(COMPOSE) -f $(COMPOSE_FILE) exec $(SERVICE) bash

sh:
	@echo "Usage: make sh SERVICE=name"
	@$(COMPOSE) -f $(COMPOSE_FILE) exec $(SERVICE) sh

stop:
	$(COMPOSE) -f $(COMPOSE_FILE) stop

start:
	$(COMPOSE) -f $(COMPOSE_FILE) start

prune:
	docker system prune -f

dump:
	bash ./dump_db.sh

restore:
	bash ./restore_db.sh

rebuild:
	$(COMPOSE) -f $(COMPOSE_FILE) down --volumes --remove-orphans
	$(COMPOSE) -f $(COMPOSE_FILE) up -d --build

