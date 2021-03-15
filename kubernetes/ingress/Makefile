TRAEFIK_VERSION = "traefik:v2.4"
K3S_VERSION = "rancher/k3s:v1.20.2-k3s1"

.PHONY: all up def traefik resources stat pull

all: pull up def traefik resources stat

up:
	-k3d cluster delete mycluster
	k3d cluster create mycluster \
		--api-port 6550 \
		-p 80:80@loadbalancer \
		--k3s-server-arg '--no-deploy=traefik'\
		-i ${K3S_VERSION}
	k3d image import ${TRAEFIK_VERSION} -c mycluster
	k3d image import traefik/whoami:latest -c mycluster

pull:
	docker pull ${TRAEFIK_VERSION}
	docker pull traefik/whoami:latest

def:
	-kubectl delete -f src/stack/
	kubectl apply -f src/stack/

traefik:
	-kubectl delete -f src/traefik.yml
	kubectl apply -f src/traefik.yml

resources:
	-kubectl delete -f src/resources.yaml
	kubectl apply -f src/resources.yaml

stat:
	kubectl get all

down:
	k3d cluster delete mycluster

test: all tests down

tests:
	./test/test.sh
