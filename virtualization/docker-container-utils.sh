# Postgree

$ docker run --name customers-db -e POSTGRES_DB=customers -e POSTGRES_USER=customers -e POSTGRES_PASSWORD=customers -d -p 5432:5432 postgres:latest

# MySql https://hub.docker.com/_/mysql

$ docker run --name test-mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=mysql-db -e MYSQL_USER=user -e MYSQL_PASSWORD=user -d -p 3306:3306 mysql:latest
