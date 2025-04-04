all: 
	mkdir -p /home/ssaadaou/data/wordpress
	mkdir -p /home/ssaadaou/data/mariadb
	sudo chmod -R 777 /home/ssaadaou/data
	docker-compose -f ./srcs/docker-compose.yml up --build -d

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -a -q)
	
	docker system prune -af
	docker volume rm $$(docker volume ls -q)
	# docker network rm $$(docker network ls -q)
	sudo rm -rf /home/ssaadaou


