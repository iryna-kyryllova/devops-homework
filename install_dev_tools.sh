#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get update

PROGS="docker.io docker-compose python3 python3-pip"

for prog in $PROGS; do
    if dpkg -l | grep -qw $prog; then
        echo "$prog is already installed."
    else
        echo "Installing $prog..."
        apt-get install -y $prog
    fi
done

# Встановлюємо Django через pip
if python3 -m django --version >/dev/null 2>&1; then
    echo "Django is already installed."
else
    echo "Installing Django..."
    python3 -m pip install Django
fi
