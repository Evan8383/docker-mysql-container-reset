#!/usr/bin/bash
# Store container name
container="dev-mysql"
containerID="$(docker inspect --format="{{.Id}}" $container)"

# Check if mysql container exists
if [ "$(docker ps -f name=$container)" ]; then
  [ "$(docker stop $container)" ]
  [ "$(docker remove $container)" ]
  [ "$(docker run --name dev-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql)" ]
fi