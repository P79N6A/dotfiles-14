#!/bin/bash

artisan() {
  php artisan $*
}

laravel-project() {
  echo -e "Creating new Laravel project...\n"
  composer create-project laravel/laravel $*

  echo -e "Setting folders permission...\n"
  cd $1
  chmod -R 0775 storage bootstrap/cache database/seeds

  echo -e "Installing require-dev packages...\n"
  composer install
}

laravel-frontend-preset() {
  composer require laravelnews/laravel-twbs4
  php artisan preset bootstrap4-auth
  npm install
  npm run dev
}

# init() {
#   echo -e "Initialize...\n"
#   composer require laravelnews/laravel-twbs4
#   php artisan preset bootstrap4-auth
# }
