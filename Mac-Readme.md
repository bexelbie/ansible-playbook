# Mac OS

# Maintenance
1. Consider checking for file changes that may get overwritten: `ansible-playbook macosx.yml --ask-become-pass --ask-vault-pass --check --diff`
1. Rerun the playbook as needed: `ansible-playbook macosx.yml --ask-become-pass --ask-vault-pass`

# Install

## Phase 1 - base setup

1. Install the OS
1. Install home-brew - https://brew.sh
1. Edit the osxfuse library to not run the postflight -- then run below with no update -- then fix it
   1. `HOMEBREW_NO_AUTO_UPDATE=1 brew install osxfuse`
1. `brew install ansible pinentry-mac gpg`
1. mount the secure file store using hte password in 1Password

## Phase 2 - Ansible some of the things (dotfiles, password files, etc.)

1. Verify inventory and varfiles
1. `ansible-galaxy install -r requirements.yml`
1. `ansible-playbook macosx.yml -i inventory --ask-become-pass --ask-vault-pass`

## Phase 3 - Manual Steps

1. Add ~/bin/gocryptfs-launcher.app to Login Items via System Preferences->User
1. Run manual steps in Mac-manual-steps.md
