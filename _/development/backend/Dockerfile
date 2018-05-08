FROM elixir:latest

ARG HOSTUID=1000
ARG HOSTGID=1000
ARG HOSTUSER=chat

# create mount directories
RUN mkdir /chat
RUN chown -R $HOSTUID:$HOSTGID /chat
VOLUME /chat

# add user
RUN addgroup --gid $HOSTGID chat
RUN adduser --uid $HOSTUID --gid $HOSTGID  --gecos "" --disabled-password --quiet chat
RUN echo "HOSTUSER='$HOSTUSER'" >> /etc/environment;

# install dev dependencies
RUN apt-get update && apt-get install -y inotify-tools

# install hex and phoenix
RUN su chat -c "mix local.hex --force --if-missing"
RUN su chat -c "mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez"

# basic container setup
EXPOSE 4000
WORKDIR /chat
ENTRYPOINT ["/chat/_/development/backend/entrypoint.sh"]
