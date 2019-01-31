# tna-wp-dev

A Docker WordPress development environment for TNA.

* [WordPress latest](https://hub.docker.com/_/wordpress/)
* [MariaDB](https://mariadb.org/)
* [WP CLI](https://wp-cli.org/)

### Requirements

To run a Docker environment, you will need [Docker](https://www.docker.com/get-started).

### Getting started

The Docker environment and a set of tools for theme development. To quickly get started, you can simply run the following:

```
# Copy the files
git clone https://github.com/nationalarchives/tna-wp-dev.git

# Make build.sh executable
chmod +x ./build.sh

# Run build
./build.sh [ADMIN EMAIL]
```

### Starting the website

```
# Go to
http://localhost:8080

# Go to dashboard
http://localhost:8080/wp-admin
```

### Defining ports

At default, port 8080 is used for the WordPress installation and port 8081 for the database. You may change the ports by editing the `.env` file:

```bash
# Edit port variables
DB_PORT=8081
APP_PORT=8080
```

### Default WordPress admin credentials

* **Username:** admin
* **Password** admin
* **Email:** email address entered at run build

### Using wp-cli

```bach
# Install a plugin
docker-compose run --rm wp-cli plugin install <some-plugin>

# Import a database
docker-compose run --rm wp-cli db import <sql-db-export>
```

### Useful Docker commands

```bash
# View running containers
docker ps

# View images
docker images

# Stop running containers
docker-compose kill

# Start containers
docker-compose up -d
```
