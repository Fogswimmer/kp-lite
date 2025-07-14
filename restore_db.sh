#!/bin/bash

set -e

IFS=$'\n\t'

ENV_FILE=".env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Environmental file $ENV_FILE not found!"
  exit 1
fi

set -a
source <(grep -E '^(DB_NAME|DB_USER|DB_PASSWORD)=' "$ENV_FILE" | sed 's/^export //')
set +a

: "${DB_NAME:? DB_NAME is not set}"
: "${DB_USER:? DB_USER is not set}"

DB_CONTAINER="db"
DUMP_PATH="./symfony/kp_lite_dump.sql"
CONTAINER_DUMP_PATH="/dump.sql"

echo "Copying dump file to the db container..."
docker cp "$DUMP_PATH" "$DB_CONTAINER:$CONTAINER_DUMP_PATH"

echo "Dropping database: '$DB_NAME'..."
docker exec -i "$DB_CONTAINER" psql -U "$DB_USER" -d postgres -c "DROP DATABASE IF EXISTS \"$DB_NAME\";"

echo "Creating database '$DB_NAME'..."
docker exec -i "$DB_CONTAINER" psql -U "$DB_USER" -d postgres -c "CREATE DATABASE \"$DB_NAME\";"

echo "Importing dump into '$DB_NAME'..."
docker exec -i "$DB_CONTAINER" psql -U "$DB_USER" -d "$DB_NAME" < "$DUMP_PATH"

echo "Removing dump file from container..."
docker exec -i "$DB_CONTAINER" rm "$CONTAINER_DUMP_PATH"

echo "Database '$DB_NAME' has been successfully restored!"

