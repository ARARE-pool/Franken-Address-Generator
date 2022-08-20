#!/bin/bash
## Fraken Address Creation

read -p "Enter Pledge Address: " PLEDGE

PLEDGE_Bech32=$(bech32 <<< $PLEDGE)
STAKE_KEY=${PLEDGE_Bech32: -56}

read -p "Enter User Address: " USER_ADDRESS

USER_BECH32=$(bech32 <<< $USER_ADDRESS)
USER_BECH32_NO_STAKE=${USER_BECH32:0:58}
USER_STAKE_COMBO="$USER_BECH32_NO_STAKE$STAKE_KEY"
FRANKEN=$(bech32 addr_test <<< $USER_STAKE_COMBO)

echo "Franken Address : $FRANKEN"
