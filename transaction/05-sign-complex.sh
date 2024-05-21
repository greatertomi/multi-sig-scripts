#!/bin/bash

. env.example

# This does not work

cardano-cli transaction sign \
--signing-key-file "${WALLET_PATH}/payment1.skey" \
--tx-body-file "${WALLET_PATH}/tx.raw" \
--out-file "${WALLET_PATH}/payment1.witness" \
${NETWORK}

cardano-cli transaction sign \
--signing-key-file "${WALLET_PATH}/payment2.skey" \
--tx-body-file "${WALLET_PATH}/tx.raw" \
--out-file "${WALLET_PATH}/payment2.witness" \
${NETWORK}

cardano-cli transaction sign \
--signing-key-file "${WALLET_PATH}/payment3.skey" \
--tx-body-file "${WALLET_PATH}/tx.raw" \
--out-file "${WALLET_PATH}/payment3.witness" \
${NETWORK}

cardano-cli transaction assemble \
--tx-body-file ${WALLET_PATH}/tx.raw \
--witness-file ${WALLET_PATH}/payment1.witness \
--witness-file ${WALLET_PATH}/payment2.witness \
--witness-file ${WALLET_PATH}/payment3.witness \
--out-file ${WALLET_PATH}/tx.signed
