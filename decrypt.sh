#!/bin/sh

gpg --quiet --batch --yes --decrypt --passphrase="$PASSPHRASE" \
--output service-account.json service-account.json.gpg