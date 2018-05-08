#!/bin/sh

mix deps.get --force
mix ecto.migrate
mix ${1}
