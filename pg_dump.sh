#/bin/bash
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
DUMP_PATH="~/kp-lite/dump.sql"

echo "Generating dump file..."
docker exec -i "$DB_CONTAINER" /bin/bash -c "PGPASSWORD=$DB_PASSWORD pg_dump --username=$DB_USER $DB_NAME" > "$DUMP_PATH"
echo "Database dump is ready at ${DUMP_PATH}"

echo
read -p "Do you want to restore the database from this dump now? (y/n): " confirm
case "$confirm" in
  [yY][eE][sS]|[yY])
    echo "Starting restore process..."
    ./restore_db.sh
    ;;
  *)
    echo "Skipping restore. Done."
    ;;
esac
