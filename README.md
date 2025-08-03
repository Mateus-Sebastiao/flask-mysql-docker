# Containerizando Flask App + MySQL

Este projeto é uma base para prática de DevOps com Docker, CI/CD...  a aplicação original foi clonada de [Brad Traversy](https://github.com/bradtraversy/myflaskapp) e será evoluída para um ambiente moderno multi-containers, automação e infraestrutura como código.

Após aprender o suficiente com Docker, containers, imagens, registros, volumes, redes e afins. Eu vou containerizar uma aplicação  multi-containers completo; sem esquecer as outras ferramentas necessárias para funcionar numa infraestrutura moderna.

## Funcionalidades

- Containerização com Docker (ambientes dev e prod)
- Orquestração com Docker-Compose
- Automação de tarefas com Makefile
- Flask + SQLAlchemy
- Migrations Automáticas com Flask-Migrate

## Getting Started

### Requisitos

- Docker
- Docker-Compose

### Clonar & Rodar

```bash
git clone https://github.com/Mateus-Sebastiao/flask-mysql-docker.git
cd flask-mysql-docker/
cp .env.example .env  # edite se necessário
docker-compose up --build # ou roda: make run
```

## Como rodar o ambiente de desenvolvimento

```bash
make run
make logs
```

## Como rodar o ambiente de produção

Você vai fazer build da imagem para fazer push para algum `Registry`.

```bash
docker build -t myflask-prod -f Dockerfile.prod .
docker run -p 5000:5000 --name myflask-app myflask-prod
```

Fazendo push para o `registry`:

```bash
docker tag myflask-prod:latest <como-necessario-para-o-registry>:<conforme-necessario>
```

