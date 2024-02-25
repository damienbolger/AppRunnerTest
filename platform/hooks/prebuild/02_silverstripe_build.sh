#!/bin/bash
# This hook is called after the code has been downloaded.

if [ -n "${BYPASS_DEV_BUILD}" ];
then
  if [ ${BYPASS_DEV_BUILD} == "1" ]
  then
    echo "Bypassing dev/build"
    exit
  fi
fi

echo "Creating silverstripe-cache dir if not already there"
mkdir -p ./silverstripe-cache
echo "Running dev/build"
./vendor/bin/sake dev/build flush=1
echo "Copying silverstripe-cache root dir to www-data dir"
cp ./silverstripe-cache/root ./silverstripe-cache/www-data

