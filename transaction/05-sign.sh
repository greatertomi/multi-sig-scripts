#!/bin/bash

. ./env

cardano-cli transaction sign \
--signing-key-file "${WALLET_PATH}/payment1.skey" \
--signing-key-file "${WALLET_PATH}/payment2.skey" \
--signing-key-file "${WALLET_PATH}/payment3.skey" \
--tx-body-file "${WALLET_PATH}/tx.raw" \
--out-file "${WALLET_PATH}/tx.signed" \
${NETWORK}
