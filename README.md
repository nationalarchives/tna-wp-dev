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

### Default WordPress admin credentials

* **Username:** admin
* **Password** admin
* **Email:** variable at build

### Using wp-cli

```bach
docker-compose run --rm wp-cli plugin install <some-plugin>
```
