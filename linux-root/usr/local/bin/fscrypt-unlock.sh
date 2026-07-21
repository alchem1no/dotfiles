#!/bin/bash

# Logging
exec 2>>/tmp/fscrypt-pam.log
echo "=== $(date) ===" >> /tmp/fscrypt-pam.log
echo "PAM_TYPE=$PAM_TYPE PAM_USER=$PAM_USER" >> /tmp/fscrypt-pam.log
[ "$PAM_TYPE" = "auth" ] || exit 0

IFS= read -r -s password
echo "Attempting unlock..." >> /tmp/fscrypt-pam.log
echo "$password" | fscrypt unlock "/home/$PAM_USER" 2>>/tmp/fscrypt-pam.log
echo "fscrypt exit code: $?" >> /tmp/fscrypt-pam.log
exit 0
