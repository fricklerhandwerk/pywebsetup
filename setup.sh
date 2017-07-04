#!/bin/sh

# set up nginx server config and hosts file to use current directory as hostname

# in case this is a prefixed installation, e.g. homebrew
if [[ $(which nginx) == "/usr/local/"* ]]
then
    PREFIX="/usr/local"
fi

NAME=$(basename ${PWD})

sed  "s#{dir}#${PWD}#g; s#{name}#${NAME}#g; s#{prefix}#${PREFIX}#g" app.server > ${NAME}.server

cp app.ini ${NAME}.ini

echo "127.0.0.1 ${NAME}.local" | sudo tee --append /etc/hosts

