#!/bin/bash
apt remove ethereum --purge
apt autoremove
rm -rf ~/.ethereum
rm -rf ~/.ethash
rm -rf ~/.clef
add-apt-repository --remove ppa:ethereum/ethereum
rm -rf /usr/bin/geth /usr/local/bin/geth
