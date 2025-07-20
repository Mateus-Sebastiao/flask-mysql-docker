#!/bin/sh

echo "Esperando o banco subir..."

# Espera o banco de dados estar disponível
while ! nc -z $MYSQL_HOST $MYSQL_PORT; do
  sleep 1
done

echo "Banco disponível!"

# Inicializa migrações se ainda não existir a pasta
if [ ! -d "migrations" ]; then
  echo "Inicializando migrações..."
  flask db init
fi

echo "Aplicando migrações..."
flask db migrate -m "initial"
flask db upgrade

echo "Iniciando aplicação Flask..."
flask run --host=0.0.0.0