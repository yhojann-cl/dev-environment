# Development Environment with Docker Compose

This repository provides a complete `docker-compose.yml` configuration for setting up the following services:

- **PostgreSQL 12**
- **MongoDB 8.0.4**
- **SMTP Server using boky/postfix**
- **BIND9 DNS Server**

## Requirements

- Docker
- Docker Compose

## Getting Started

To start the services, run:

```bash
docker compose up -d
```

## Services Overview

### PostgreSQL

- **Image**: `postgres:12`
- **Port**: `5432` (bound to `127.0.0.1`)
- **Environment**:
  - `POSTGRES_USER=postgres`
  - `POSTGRES_PASSWORD=dev`
  - `POSTGRES_DB=dev`
- **Volume:** `./dev/postgres:/var/lib/postgresql/data`

### MongoDB

- **Image**: `mongo:8.0.4`
- **Port**: `27017` (bound to `127.0.0.1`)
- **Environment**:
  - `MONGO_INITDB_ROOT_USERNAME=root`
  - `MONGO_INITDB_ROOT_PASSWORD=dev`
  - `MONGO_INITDB_DATABASE=dev`
  - `DB_NAME=dev`
  - `DB_USER=dev`
  - `DB_PASSWORD=dev`
- **Volume**: `./dev/mongodb:/data/db`

### SMTP Server (Postfix)

- **Image**: `boky/postfix:latest`
- **Port**: `2525` (bound to `127.0.0.1`)
- **Environment**:
  - `HOSTNAME=mail.example.com`
  - `ALLOW_EMPTY_SENDER_DOMAINS=true`
- ** Volume**: `./dev/postfix:/etc/opendkim/keys`

### BIND9 DNS Server

- **Image**: `internetsystemsconsortium/bind9:9.18`
- **Ports**:
  - `53/udp` bound to `127.0.0.1:5353`
  - `53/tcp` bound to `127.0.0.1:5353`
- **Volumes**:
  - `./dev/bind9/named.conf:/etc/bind/named.conf`
  - `./dev/bind9/named.conf.local:/etc/bind/named.conf.local`
  - `./dev/bind9/db.example.com:/etc/bind/db.example.com`
- **Environment**:
  - `TZ=UTC`
- **Capabilities**:
  - `NET_BIND_SERVICE`

## Notes

- All services are restricted to localhost (`127.0.0.1`) for security during development.
- Make sure the volume paths and configuration files exist before starting the containers.

