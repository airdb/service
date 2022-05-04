SHELL = /bin/bash
SRC_PATH = cmd
SERVICE = "airdb-noah-live.service"
SYSTEMD_DIR = "/etc/systemd/system/"

.PHONY: build

all: help

help: ## Show help messages
	@echo "Airdb Service Management"
	@echo
	@echo "Usage:"
	@echo "  make [command]"
	@echo
	@echo "Available Targets:"
	@sed -n '/##/s/\(.*\):.*##/  \1#/p' ${MAKEFILE_LIST} | grep -v "MAKEFILE_LIST" | column -t -c 2 -s '#' | column -t -c 2 -s ':'

.PHONY: install
install: ## Install systemd
	echo sudo cp {SERVICE} ${SYSTEMD_DIR}${SERVICE}
	echo sudo systemctl daemon-reload

.PHONY: reload
reload: ## Reload systemd
	echo sudo systemctl daemon-reload

clean: ## Clean up systemdp
	echo sudo rm -f ${SYSTEMD_DIR}${SERVICE}
	echo sudo systemctl daemon-reload
	echo sudo systemctl enable ${SERVICE}
	go fmt ./...
	rm -f $(FILES)

list ls: ## List services
	@echo $(shell ls *.service)
	@echo 
	@echo "========local systemd========"
	systemctl status | grep airdb
