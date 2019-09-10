# tna-wp-dev

A Docker WordPress development environment for TNA.

* [WordPress latest](https://hub.docker.com/_/wordpress/)
* [MariaDB](https://mariadb.org/)
* [WP CLI](https://wp-cli.org/)

### Requirements

To run a Docker environment, you will need [Docker](https://www.docker.com/get-started).

### Getting started

The Docker environment and a set of tools for theme development. To quickly get started, you can simply run the following:

```bash
# Copy the files
git clone https://github.com/nationalarchives/tna-wp-dev.git

# Make build.sh executable
chmod +x ./build.sh

# Run build
./build.sh [ADMIN EMAIL]
```

### Starting the website

```bash
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

```bash
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

### Restoring a database

The TNA database is used in this example.

- Download [BBEdit](https://www.barebones.com/products/bbedit/). This allows us to find and replace text on large files. Open BBEdit, and then open your wordpress dump sql file.
- Click `Search` on the top toolbar, and then click `Find`
- Using Replace All, replace the load balancer URL with `localhost:8080` (if you don't know the url, please ask one of the developers.)
- Go back to `Search > Find`, and find the line in your file that begins with the following:
```
INSERT INTO `wp_users`
```
- Replace the first user in the list of users with the following:

`(1,'admin','21232f297a57a5a743894a0e4a801fc3','admin','youremail@nationalarchives.gov.uk','','2014-03-17 11:26:28','',0,'admin',0,0)`

- Save the file as `wp_dump_new.sql` and place it in your `tna-wp-dev` folder.
- Go to `tna-wp-dev` in your terminal. Make sure your container is running. 
- Run docker -ps a and memorise the first four characters of the `mariadb` container ID.
- Run `cat wp_dump_new.sql | docker exec -i {id} /usr/bin/mysql -u root --password=password wordpress`, replacing `{id}` with the first four characters of your mariadb ID.
- Clone the tna theme in `wp-content\themes`.
- Login to wp-admin with username `admin`, password `admin`.
- Go to the plugins page, and install `Advanced Custom Fields`.
- Go to the settings > permalinks, and click `Save Changes`.
