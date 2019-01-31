#!/bin/bash

source .env

docker-compose up -d

tput setaf 6; echo "Wait for database..."; tput sgr0
sleep 20

WP_URL=localhost:${APP_PORT}
WP_TITLE="TNA WordPress Development"
WP_ADMIN_USER=admin
WP_ADMIN_PASS=admin
WP_ADMIN_EMAIL=$1
wp="docker-compose run --rm wp-cli"

# Install and configure Wordpress
tput setaf 6
echo "Installing Wordpress..."
echo "URL: localhost:"${APP_PORT}
echo "Site name: "${WP_TITLE}
tput sgr0
$wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMIN_USER}" --admin_password="${WP_ADMIN_PASS}" --admin_email="${WP_ADMIN_EMAIL}"
tput setaf 6; echo "Configuring Wordpress..."; tput sgr0
$wp config set WP_DEBUG true
$wp rewrite structure '/%postname%/'
$wp widget reset --all

# Install plugins
tput setaf 6; echo "Installing plugins..."; tput sgr0
$wp plugin install https://downloads.wordpress.org/plugin/wordpress-seo.9.4.zip --activate
