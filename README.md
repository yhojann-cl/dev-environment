# Development Environment with Docker Compose

This repository provides a complete `docker-compose.yml` configuration for
setting up services:

- **PostgreSQL 12**
- **MySQL 8**
- **MongoDB 8**
- **Postfix SMTP**
- **Bind9 9**

To manage services run:

```bash
# Start services
sudo docker compose up -d;

# Stop services
sudo docker compose down;
```


## Services Overview

### MySQL

This service runs a MySQL 8.0 instance for local development. It creates a
default database and user credentials for immediate use.

- **Image**: `mysql:8.0`
- **Port**: `3306` (bound to `127.0.0.1`)
- **Environment**:
  - `MYSQL_ROOT_PASSWORD=dev`
  - `MYSQL_DATABASE=dev`
  - `MYSQL_USER=dev`
  - `MYSQL_PASSWORD=dev`
- **Volume:** `./dev/mysql:/var/lib/mysql`

You can connect to the MySQL server using the following command:

```
mysql -h 127.0.0.1 -P 3306 -u dev -p
```


### PostgreSQL

The postgres service provides a reliable PostgreSQL 12 database instance
preconfigured with a default database named dev. It uses the username postgres
and the password dev, and stores persistent data on the host under
`./dev/postgres`. This setup is ideal for local development and testing
purposes, offering compatibility with a wide range of PostgreSQL tools and
drivers.

To connect to the database from your host machine using the psql command-line
client, run:

```bash
psql -h 127.0.0.1 -p 5432 -U postgres -d dev
```

To restart all database including serials, increments, tables, procedures and
views, you can execute this sql command on the prompt:

```sql
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
```

- **Image**: `postgres:12`
- **Port**: `5432` (bound to `127.0.0.1`)
- **Environment**:
  - `POSTGRES_USER=postgres`
  - `POSTGRES_PASSWORD=dev`
  - `POSTGRES_DB=dev`
- **Volume:** `./dev/postgres:/var/lib/postgresql/data`

### MongoDB

The mongodb service runs a MongoDB 8.0.4 instance with an initialized root user
(`root`) and password (`dev`). The default database dev is also created on
startup. Data is persisted in the `./dev/mongodb` directory on the host, making
this setup suitable for local development and containerized application testing.

To connect to the MongoDB instance from your host using the mongosh shell, run:

```bash
mongosh "mongodb://root:dev@127.0.0.1:27017/dev?authSource=admin"
```

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

Postfix with STARTTLS and SASL Authentication. This service provides a fully
functional mail server using Postfix, supporting:

- SMTP over port **587** with **STARTTLS**
- Authentication via **SASL** (login/password)
- Custom user setup (`no-reply@example.com`)
- Persistent volumes for mail data, state, logs, and configuration
- Compatible with external clients like Thunderbird, Outlook, or `msmtp`

- **Ports**:
  - `25/udp` bound to `127.0.0.1:9925` Basic SMTP (unencrypted sending).
  - `110/udp` bound to `127.0.0.1:9110` POP3 (unencrypted receiving).
  - `143/udp` bound to `127.0.0.1:9143` IMAP (unencrypted remote access).
  - `465/udp` bound to `127.0.0.1:9465` SMTP over SSL (secure sending).
  - `587/udp` bound to `127.0.0.1:9587` SMTP with STARTTLS (authenticated).
  - `993/udp` bound to `127.0.0.1:9993` IMAPS (IMAP over SSL).
  - `995/udp` bound to `127.0.0.1:9995` POP3S (POP3 over SSL).
- **volumes**:
  - `./dev/mail/maildata:/var/mail	` User mailbox storage.
  - `./dev/mail/mailstate:/var/mail-state` Mail server internal state.
  - `./dev/mail/maillogs	:/var/log/mail` Log files.
  - `./dev/mail/config:/tmp/docker-mailserver` Configuration files & SSL certificates.
- **Environment**:
  - `ENABLE_SPAMASSASSIN=0`
  - `ENABLE_CLAMAV=0`
  - `ENABLE_FAIL2BAN=0`
  - `ENABLE_POSTGREY=0`
  - `ENABLE_SASLAUTHD=1`
  - `PERMIT_DOCKER=network`
  - `ONE_DIR=1`
  - `SSL_TYPE=manual`
  - `TLS_LEVEL=modern`
  - `SASL_PASSWD=no-reply@example.com:dev`

For account creation:

```bash
docker run --rm \
  -v ./dev/mail/config:/tmp/docker-mailserver \
  mailserver/docker-mailserver:latest \
  setup email add no-reply@example.com dev;
```

For testing access can execute the command:

```bash
swaks --to user@example.com \
  --from no-reply@example.com \
  --server 127.0.0.1:9587 \
  --auth LOGIN \
  --auth-user no-reply@example.com \
  --auth-password dev \
  --tls \
  --data "Subject: Test Mail\n\nHello from Postfix with STARTTLS";
```

### BIND9 DNS Server

The bind9 service in this setup acts as a fully functional DNS server,
supporting all standard DNS record types as defined by the relevant RFCs,
including zone transfers (AXFR). All DNS records are configured under the domain
`example.com`, making it suitable for testing and development environments that
require custom DNS resolution. You can query the DNS server locally using the
dig utility. For example, to retrieve the A record of www.example.com, use the
following command:

```bash
dig -t a example.com @127.0.0.1 -p 5353;
dig -t mx example.com @127.0.0.1 -p 5353;
dig -t axfr example.com @127.0.0.1 -p 5353;
```

- **Image**: `ubuntu/bind9:latest`
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

