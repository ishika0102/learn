#!/bin/bash

# Backup PostgreSQL user data
docker exec -t postgres-database pg_dumpall -U bn_keycloak -f /backup/backup.sql

# Copy the backup file to host
docker cp postgres-database:/backup/backup.sql ../data/backup.sql
