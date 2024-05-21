#!/bin/bash

. env.example

cardano-cli address build \
--payment-script-file "${WALLET_PATH}/policy.script" \
${NETWORK} --out-file "${WALLET_PATH}/script.addr"

cardano-cli address build \
--payment-script-file "${WALLET_PATH}/policy.script" \
--stake-verification-key-file "${WALLET_PATH}/stake.vkey" \
${NETWORK} --out-file "${WALLET_PATH}/script-with-stake.addr"

# Transfer test ADA to the script address and verify the balance
# $ cardano-cli query utxo ${NETWORK} --address ${WALLET_PATH}/script.addr
