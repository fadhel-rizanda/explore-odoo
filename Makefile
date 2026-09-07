.PHONY: help up down restart logs logs-db shell start stop ps

PODMAN = podman
PODMAN_COMPOSE = ${PODMAN} compose
CONTAINER_ODOO = odoo
CONTAINER_DB = odoo-postgres

help:
	@echo Usage: make [target]
	@echo Targets:
	@echo   up        - Start the Odoo and PostgreSQL containers
	@echo   down      - Stop and remove the Odoo and PostgreSQL containers
	@echo   restart   - Restart the Odoo and PostgreSQL containers
	@echo   logs      - Show logs for the Odoo container
	@echo   logs-db   - Show logs for the PostgreSQL container
	@echo   shell     - Open a shell in the Odoo container
	@echo   start     - Start the Odoo and DB containers
	@echo   stop      - Stop the Odoo and DB containers
	@echo   ps        - Show status of containers

up:
	${PODMAN_COMPOSE} up -d

down:
	${PODMAN_COMPOSE} down

restart:
	${PODMAN_COMPOSE} restart

logs:
	${PODMAN} logs -f ${CONTAINER_ODOO}

logs-db:
	${PODMAN} logs -f ${CONTAINER_DB}

shell:
	${PODMAN} exec -it ${CONTAINER_ODOO} /bin/bash

start:
	${PODMAN} start ${CONTAINER_ODOO} ${CONTAINER_DB}

stop:
	${PODMAN} stop ${CONTAINER_ODOO} ${CONTAINER_DB}

ps:
	${PODMAN} ps