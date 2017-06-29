FROM elixir:1.4.5
COPY . /project
WORKDIR /project
ENV MIX_ENV=prod
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez \
    && mix local.hex --force \
    && mix local.rebar --force \
    && mix deps.get \
    && mix compile --force \
    && npm install -g brunch \
    && brunch build --production \
    && mix phoenix.digest

ENTRYPOINT ["mix", "do", "ecto.create,", "ecto.migrate,", "phoenix.server"]
