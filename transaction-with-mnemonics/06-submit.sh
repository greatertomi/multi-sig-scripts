#!/bin/bash

. ./env

cardano-cli transaction submit \
--tx-file ${WALLET_PATH}/tx.signed \
${NETWORK}

cardano-cli transaction txid --tx-file ${WALLET_PATH}/tx.signed
