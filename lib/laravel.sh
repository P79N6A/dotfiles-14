#!/bin/bash

artisan() {
  php artisan $*
}

laravel-project() {
  composer create-project laravel/laravel $*

  cd $1 && chmod -R storage bootstrap/cache database/seeds && composer install && cd ../
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
