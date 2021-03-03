# PostgreSQL and pgAdmin 4<br>Docker containers

### Install and config

### Step 1 - Docker network creation

For integrate the usage of the Docker containers of Postgresql and pgAdmin 4.

```shell
docker network create --driver bridge postgres-network
```

### Step 2 - PostgreSQL container

Container to instantiate the PostgreSQL database.

```shell
docker run --name <name-of-postgre> --network=postgres-network -e "POSTGRES_PASSWORD=<your-pass>" -p 5432:5432 -d postgres
```

### Step 3 - pgAdmin 4 container

Container to instantiate the pgAdmin 4 administration tool.

```shell
docker run --name <name-of-pgadmin> --network=postgres-network -p 15432:80 -e "PGADMIN_DEFAULT_EMAIL=<your-email>@email.com" -e "PGADMIN_DEFAULT_PASSWORD=<your-pass>" -d dpage/pgadmin4
```

### Step 4 - Login on pgAdmin 4

1. Reach this address on browser: http://localhost:15432/
2. Create a new server
3. On tab GENERAL, procide a Name and Comments (optional)
4. On tab CONNECTION
   4.1. Fill Host with your database name informed on Docker container
   4.2 - Inform username and password same provided on container creation
   4.3 - Click SAVE button
5. Enjoy!!
