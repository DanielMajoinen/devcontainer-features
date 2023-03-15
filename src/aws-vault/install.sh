#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
  echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
  exit 1
fi

# Ensure that login shells get the correct path if the user updated the PATH using ENV.
rm -f /etc/profile.d/00-restore-env.sh
echo "export PATH=${PATH//$(sh -lc 'echo $PATH')/\$PATH}" > /etc/profile.d/00-restore-env.sh
chmod +x /etc/profile.d/00-restore-env.sh

export DEBIAN_FRONTEND=noninteractive

echo "Installing aws-vault..."

ARCHITECTURE="$(uname -m)"
curl -o /usr/bin/aws-vault https://github.com/99designs/aws-vault/releases/download/v7.1.0/aws-vault-linux-${ARCHITECTURE}
chmod 755 /usr/bin/aws-vault
