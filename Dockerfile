# Primeiro estágio
FROM python:3.11-slim AS builder

WORKDIR /install

RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    libmariadb-dev-compat \
    default-libmysqlclient-dev \
    default-mysql-client \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ./app/requirements.txt .

RUN pip install --no-cache-dir --prefix=/install/packages -r requirements.txt

# Segundo estágio
FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libmariadb-dev-compat \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*


COPY --from=builder /install/packages /usr/local

COPY ./app/ .

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]