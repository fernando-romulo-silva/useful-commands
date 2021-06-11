# Postgree

$ docker run --name test-postgres -p 5432:5432 -e POSTGRES_DB=postgres -e POSTGRES_USER=user -e POSTGRES_PASSWORD=user -d postgres:latest

# MySql https://hub.docker.com/_/mysql

$ docker run --name test-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=mysql-db -e MYSQL_USER=user -e MYSQL_PASSWORD=user -d mysql:latest
 
