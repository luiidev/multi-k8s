#!/bin/sh

gpg --quiet --batch --yes --decrypt --passphrase="$PASSPHRASE" \
--output ./service-account.json ./k8s/service-account.json.gpg