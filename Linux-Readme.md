# Linux Workstation

1. Install Fedora Workstation
   * Encrypt disk
   * 1 data partition + boot + swap
   * After reboot, create bexelbie
1. Check for bios updates with fwupdmgr
   1. fwupdmgr refresh
   1. fwupdmgr get-devices # verify machine is in the list
   1. fwupdmgr get-updates
   1. fwupdmgr update
1. Manually update the system `dnf update -y` and reboot
1. Clone this repository into a temporary location
1. Verify we have required software installed, dnf install -y gnupg2 pass git ykpers gocryptfs
1. Restore the public key for bexfiles and enable the use of the yubikey
   1. gpg2 --import docs/bexfiles.public.key
   1. gpg2 --card-status # verify the yubikey
1. Reload my password store and set up for the playbook - see step0.md
1. `sudo dnf install -y ansible python3-dnf`
1. Verify inventory and varfiles/workstation_vars.yml
1. mount the secure file store
1. Install the remote roles: ansible-galaxy install -r requirements.yml
1. `ansible-playbook workstation.yml -i inventory --ask-become-pass`
1. Run manual steps in manual-steps.md
1. Manually update the system `dnf update -y` and reboot again
