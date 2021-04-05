# Linux Workstation

1. Install Fedora Workstation
   * Encrypt disk if appropriate
   * 1 data partition + boot + swap
   * After reboot, create bexelbie
1. Check for bios updates with fwupdmgr
   1. fwupdmgr refresh
   1. fwupdmgr get-devices # verify machine is in the list
   1. fwupdmgr get-updates
   1. fwupdmgr update
1. Manually update the system `dnf update -y` and reboot
1. Clone this repository into a temporary location
1. Verify we have required software installed, dnf install -y git
1. `sudo dnf install -y ansible python3-dnf`
1. Verify inventory and varfiles/linux_vars.yml
1. `ANSIBLE_CONFIG=./ansible-server.cfg ansible-playbook server.yml -i inventory --ask-become-pass`
1. Run manual steps in manual-steps.md
1. Manually update the system `dnf update -y` and reboot again
