#!/bin/bash

. ./env

# cardano-cli address build --payment-script-file policy.script --testnet-magic 2 --out-file script.addr
# cardano-cli address build --payment-script-file policy.script --stake-verification-key-file stake.vkey --testnet-magic 2 --out-file script-with-stake.addr

cardano-cli address build \
--payment-script-file "${WALLET_PATH}/policy.script" \
${NETWORK} --out-file "${WALLET_PATH}/script.addr"
