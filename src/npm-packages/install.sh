#!/usr/bin/env bash

USERNAME=${USERNAME:-"node"}
PACKAGES=${PACKAGES:-""}
TOKEN=${TOKEN:-""}

if [ "$(id -u)" -ne 0 ]; then
  echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
  exit 1
fi

# Ensure that login shells get the correct path if the user updated the PATH using ENV.
rm -f /etc/profile.d/00-restore-env.sh
echo "export PATH=${PATH//$(sh -lc 'echo $PATH')/\$PATH}" > /etc/profile.d/00-restore-env.sh
chmod +x /etc/profile.d/00-restore-env.sh

export DEBIAN_FRONTEND=noninteractive

# Install NPM packages
echo "Installing NPM packages..."

if [ "${TOKEN}" != "" ]; then
  export NPM_TOKEN=${TOKEN}
  echo "//registry.npmjs.org/:_authToken=${TOKEN}" >> ${HOME}/.npmrc
fi

if [ "${PACKAGES}" != "" ]; then
  sudo chown -R ${USERNAME} /tmp/build-features/npm-packages*
  su ${USERNAME} -c "npm install -g ${PACKAGES}"
fi
