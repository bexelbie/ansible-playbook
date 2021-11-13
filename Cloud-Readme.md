# Linux Server "in the cloud" used as a tailscale endpoint

Note: This machine is installed with Fedora IoT

# Maintenance
1. Consider checking for file changes that may get overwritten: `ansible-playbook cloud.yml --ask-become-pass --ask-vault-pass --check --diff`
1. Rerun the playbook as needed: `ansible-playbook cloud.yml --ask-become-pass --ask-vault-pass`

# Install

1. Install Fedora IoT
1. Manually add the tailscale repo to /etc/yum.repos.d and then `rpm-ostree install tailscale`
1. Reboot
1. Verify inventory and varfiles
1. `ansible-galaxy install -r requirements-server.yml`
1. `ansible-playbook cloud.yml --ask-become-pass --ask-vault-pass`
1. Reboot