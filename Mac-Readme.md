# Mac OS

## Phase 1 - base setup

1. Install the OS
1. Install home-brew - https://brew.sh
1. Edit the osxfuse library to not run the postflight -- then run below with no update -- then fix it
   1. `brew cask install osxfuse`
1. `brew install ansible pinentry-mac gpg pass gocryptfs`

## Phase 2 - passwords and more

1. Clone this repository into a temporary location
1. Restore the public key for bexfiles and enable the use of the yubikey
   1. gpg --import docs/bexfiles.public.key
   1. gpg --card-status # verify the yubikey
1. Reload my password store and set up for the playbook - see step0.md
1. mount the secure file store

## Phase 3 - Ansible some of the things (dotfiles, password files, etc.)

1. `ansible-galaxy install -r requirements.yml`
1. `ansible-playbook macosx.yml -i inventory`

## Phase 4 - Manual Steps

1. Add ~/bin/gocryptfs-launcher.app to Login Items via System Preferences->User
1. Run manual steps in manual-steps.md
