#!/bin/bash

. ./env

# Make sure you transfer the funds to the script wallet address before running this script.
# Verify the script address balance with the following command:
# cardano-cli query utxo ${NETWORK} --address $(cat ${WALLET_PATH}/script.addr)

ADDRESS=$(cat ${WALLET_PATH}/script.addr)
# Create a receiving.addr file to store the recipient address.
RECEIVER=$(cat ${WALLET_PATH}/receiving.addr)

TRANS=$(cardano-cli query utxo ${NETWORK} --address ${ADDRESS} | tail -n1)
TXIN=$(echo $TRANS | awk '{print $1 "#" $2}')

cardano-cli transaction build \
--babbage-era \
--tx-in ${TXIN} \
--change-address ${RECEIVER} \
--tx-in-script-file ${WALLET_PATH}/policy.script \
--witness-override 3 \
--out-file ${WALLET_PATH}/tx.raw \
${NETWORK}
