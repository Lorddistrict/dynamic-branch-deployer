CONSOLE=bin/console

.PHONY: sh
sh:
	docker compose exec php bash

.PHONY: restart
restart:
	docker pull ghcr.io/lorddistrict/crontab-api:latest
	docker compose up -d --build

.PHONY: image
image:
	docker build . -t ghcr.io/lorddistrict/crontab-api:latest
	docker push ghcr.io/lorddistrict/crontab-api:latest
	make restart
