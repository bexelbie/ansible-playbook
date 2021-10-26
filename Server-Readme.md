# Linux Server

# Maintenance
1. Consider checking for file changes that may get overwritten: `ansible-playbook server.yml --ask-become-pass --ask-vault-pass --check --diff`
1. Rerun the playbook as needed: `ansible-playbook server.yml --ask-become-pass --ask-vault-pass`

# Install

1. Install Fedora
   * Encrypt disk
   * 1 data partition + boot + swap
   * Create bexelbie, maybe after reboot
1. Check for bios updates with fwupdmgr
   1. fwupdmgr refresh
   1. fwupdmgr get-devices # verify machine is in the list
   1. fwupdmgr get-updates
   1. fwupdmgr update
1. Verify inventory and varfiles
1. `ansible-galaxy install -r requirements-server.yml`
1. `ansible-playbook server.yml --ask-become-pass --ask-vault-pass`
1. Reboot
