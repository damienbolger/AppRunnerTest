#!/bin/bash
# This hook is called after the code has been downloaded.
echo "start composer install"
composer install --prefer-dist --no-progress --optimize-autoloader --no-dev
composer vendor-expose copy

