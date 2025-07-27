#!/bin/bash
# Clear all environment

sudo docker-compose down;

echo 'Clearing bind9 service ...';
# rm -rf ./dev/bind9/*;

echo 'Clearing mail service ...';

sudo rm -rf ./dev/mail/config;
mkdir -p ./dev/mail/config;
touch ./dev/mail/config/.gitkeep;

sudo rm -rf ./dev/mail/data;
mkdir -p ./dev/mail/data;
touch ./dev/mail/data/.gitkeep;

sudo rm -rf ./dev/mail/logs;
mkdir -p ./dev/mail/logs;
touch ./dev/mail/logs/.gitkeep;

sudo rm -rf ./dev/mail/state;
mkdir -p ./dev/mail/state;
touch ./dev/mail/state/.gitkeep;

echo 'Clearing mongodb service ...';
sudo rm -rf ./dev/mongodb;
mkdir -p ./dev/mongodb;
touch ./dev/mongodb/.gitkeep;

echo 'Clearing mysql service ...';
sudo rm -rf ./dev/mysql;
mkdir -p ./dev/mysql;
touch ./dev/mysql/.gitkeep;

echo 'Clearing postgres service ...';
sudo rm -rf ./dev/postgres;
mkdir -p ./dev/postgres;
touch ./dev/postgres/.gitkeep;
