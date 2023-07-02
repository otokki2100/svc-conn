#!/bin/bash

echo ${domain} | tee /tmp/domain
echo ${email} | tee /tmp/email

source /etc/os-release
sudo yum-config-manager --add-repo "$(rpm --eval "https://yum.releases.teleport.dev/$ID/$VERSION_ID/Teleport/%%{_arch}/stable/v13/teleport.repo")"
sudo yum install -y teleport
# curl https://goteleport.com/static/install.sh | bash -s 13.0.2

sudo hostnamectl set-hostname ${domain}

sudo ln -s /usr/local/bin/teleport /usr/bin/
sudo ln -s /usr/local/bin/tctl /usr/bin/
sudo ln -s /usr/local/bin/tsh /usr/bin/

sudo teleport configure --acme --acme-email=${email} --cluster-name=${domain} -o /etc/teleport.yaml

systemctl enable --now teleport
