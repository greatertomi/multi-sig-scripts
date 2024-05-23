#!/bin/bash

. ./env

cardano-cli transaction submit \
--tx-file ${WALLET_PATH}/tx.signed \
${NETWORK}

cardano-cli transaction txid --tx-file ${WALLET_PATH}/tx.signed
# 74aeebaff2265bb82945d762c9e6dacd40d22f25c784caefd8dc8e64b943ed4d
# c376c57eb99ae184a9a110b62e357c5ace968eb9d6ec1ffd294e38b5c4318df4
