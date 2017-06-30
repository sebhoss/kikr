# Kikr

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Building Docker Images

```
# build docker image
$ docker build --tag sebhoss/kikr:latest .

# start postgres database
$ docker-compose up -d postgres

# build & start kikr app
$ docker-compose up [-d] kikr
# visit http://localhost:50123/
```

## Running Docker images

In order to run the latest release version using docker-compose, do the following:

1. Create a `docker-compose.yml` anywhere you want
2. Place the below example configuration into it and optionally adapt it to your needs
3. Call `docker-compose up -d` in the same directory

```
version: '3'
services:
  db-psql:
    image: postgres:latest
    environment:
      POSTGRES_DB: kikr_db
      POSTGRES_USER: psql_user
      POSTGRES_PASSWORD: psql_pass
    ports:
      - "5432:5432"
  kikr:
    build:
      context: .
      dockerfile: Dockerfile
    image: sebhoss/kikr:latest
    environment:
      PORT: 8080
      DB_NAME: kikr_db
      DB_USER: psql_user
      DB_PASS: psql_pass
      DB_HOST: db-psql
    depends_on:
      - db-psql
    ports:
      - "50123:8080" 
```

Once started, open http://localhost:50123/ to view the app.
