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
1. Verify we have required software installed, dnf install -y gnupg2 pass git ykpers gocryptfs
1. Restore the public key for bexfiles and enable the use of the yubikey
   1. gpg2 --import docs/bexfiles.public.key
   1. gpg2 --card-status # verify the yubikey
1. Reload my password store and set up for the playbook - see step0.md
1. `sudo dnf install -y ansible python3-dnf`
1. Verify inventory and varfiles/linux_vars.yml
1. mount the secure file store
1. Install the remote roles: ansible-galaxy install -r requirements.yml
1. `ansible-playbook linux.yml -i inventory --ask-become-pass`
1. Run manual steps in manual-steps.md
1. Manually update the system `dnf update -y` and reboot again

Note: To get SSH up quickly
1. Create the ssh directory: `mkdir -m 711 ~/.ssh`
1. Add authorized key: `gpg2 --export-ssh-key D875E9508202AC07E3D80E76A5EFC0D0E0EADA77\! > ~/.ssh/authorized_keys`
1. Fix file perms: `chmod go-rw ~/.ssh/authorized_keys`
