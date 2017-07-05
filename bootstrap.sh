#!/usr/bin/env bash

# Exits on error
set -e

# Check for bundler
echo -n "Step: Looking for Homebrew... "
if ! which bundler >& /dev/null; then
    echo "❌"
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "👍"
fi

# Check for Ansible
echo -n "Step: Looking for Ansible... "
if ! which ansible-playbook >& /dev/null; then
    echo "❌"
    echo "Installing Ansible"
    brew install ansible
else
    echo "👍"
fi

ansible-playbook -i "localhost" -c local playbook.yml
