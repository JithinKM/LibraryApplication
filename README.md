# LibraryApplication
An application to to add/remove books and hire books.

## prerequisites
- Java 8
- Docker compose

## Build

Run the following command from the project root directory to build the application: 

`mvn clean install -Dmaven.test.skip=true`

## Run the application

First, run the following command to start the database in a docker container:

`cd dev-tools
docker-compose up -d`

If the docker container is already running on your system, the nrun the following command from the `dev-tools` directory to stop it:
`docker-compose down`

Then start the application by executimng the following command from the project root directory:
`java -jar target/LibraryApplication-0.0.1-SNAPSHOT.jar`

The application can now be accessed at the following URL:
`http://localhost:8080`
