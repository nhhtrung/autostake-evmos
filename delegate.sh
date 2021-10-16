#!/bin/bash

WALLET=""
ADD_WALLET=
VAL_WALLET=

sleep 2

evmosd tx distribution withdraw-rewards $VAL_WALLET --commission --yes --gas auto --fees 200000aphoton --from $WALLET --chain-id evmos_9000-1 -y

sleep 10

BALANCE=$(evmosd query bank balances $ADD_WALLET | grep "amount" | cut -d'"' -f 2)
BALANCE=$(echo $BALANCE | cut -d' ' -f 2)
BALANCE=$((BALANCE - 40000000))
BALANCE=$((BALANCE - 200000))

sleep 2

printf "%b\n\n\n" "--------------------------------------------------------------------------------"

evmosd tx staking delegate $VAL_WALLET $BALANCE${RATE} --gas auto --fees 200000aphoton --from $WALLET --chain-id evmos_9000-1 -y

sleep 1800
