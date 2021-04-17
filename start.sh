#!/bin/bash

readarray -d : -t UPDATE_ME <<< $DOMAIN_NAMES

# Print each value of the array by using loop
for (( n=0; n < ${#UPDATE_ME[*]}; n++))
do
    DOMAIN="${UPDATE_ME[n]}"
    echo "[*] Starting update for $DOMAIN"
    python3 /tmp/bender/dreampy_dns/dreampy_dns.py $DOMAIN
    echo "[*] Finished update for $DOMAIN"
done
