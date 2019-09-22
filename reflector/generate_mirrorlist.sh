#!/usr/bin/sh

# Get a list of 10 mirrors, sorted by download speed that satisfy the following conditions:
# 1 - Exists in the United States
# 2 - Has been updated in the last 24 hours
/usr/bin/reflector --number 10 --sort rate --age 24  --country 'United States' --save /etc/pacman.d/mirrorlist
