#!/bin/bash

COPR_CONFIG="${HOME}/.config/copr"
mkdir -p "$(dirname ${COPR_CONFIG})"
echo '[copr-cli]' > "${COPR_CONFIG}"
for val in $(env | grep ^COPR)
do
  echo $val | sed -e 's/^COPR_//g' \
                  -e 's/^\([^=]*\)/\L\1/g' \
                  -e 's/"//g' \
                  -e 's/=/ = /g' >> "${COPR_CONFIG}"
done

exec /usr/bin/copr-cli "$@"
