#!/bin/sh

echo "Aguardando o MySQL iniciar..."
while ! mysqladmin ping -h"$MYSQL_HOST" --silent; do
    sleep 2
done

echo "Executando script SQL..."
mysql -h "$MYSQL_HOST" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" < /app/create_tables.sql

echo "Iniciando aplicação Flask..."
exec python app.py