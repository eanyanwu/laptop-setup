#!/bin/sh

# Find all the GPG-encrypted files under the .password-store directory
# Split the lines by forward-slash (i.e. /) and return everything after the 5th field. 
# Remove the .gpg extension from the files
# Pipe the list of strings to dmenu so the user can select one
selected_file=$(find ~/.password-store -name *.gpg \
    | cut -d "/" -f 5- \
    | sed s/\.gpg$// \
    | bemenu -p "Password Store: " \
    --list 10 \
    --fn 'Fira Mono 13' \
    --tf '#fa44fa' \
    --tb '#323232' \
    --fb '#323232' \
    --nb '#323232' \
    --hf '#ffffff' \
    --hb '#8789c0')



# Exit if no file was selected
[ -z $selected_file ] && exit 

# Get the contents of the password file
contents=$(pass show $selected_file) 

# Exit if there is no content.
test -z "$contents" && exit

# Parse out the password and username form contents. 
# When we get here, the $contents variable has the following format:
# <PASSWORD> username:<USERNAME>
# We can's simply split by space, because the password could have spaces in it
password=$(echo $contents | awk -F " username:" '{ print $1 }')
username=$(echo $contents | awk -F " username:" '{ print $2 }')

echo "$password" | wl-copy --trim-newline

sleep 10

wl-copy --clear
