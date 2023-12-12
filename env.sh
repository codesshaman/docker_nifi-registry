#!/bin/bash

cp  .env.example .env

echo "DB_PATH=${PWD}/database" >> .env
echo "LOGS_PATH=${PWD}/logs" >> .env
echo "FLOW_PATH=${PWD}/flow_storage" >> .env