#!/bin/sh

echo $HOME
pwd
gpg --quiet --batch --yes --decrypt --passphrase="$PASSPHRASE" \
--output $HOME/service-account.json ./k8s/service-account.json.gpg