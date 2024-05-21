#!/bin/bash

. env.example

for i in {1..3}

do
  if [ -f "${PATH}/payment${i}.skey" ] ; then
    echo "Key already exists"
  else
    cardano-cli address key-gen --verification-key-file "${WALLET_PATH}/payment${i}.vkey" --signing-key-file "${WALLET_PATH}/payment${i}.skey"
  fi
done

cardano-cli stake-address key-gen --verification-key-file "${WALLET_PATH}/stake.vkey" --signing-key-file "${WALLET_PATH}/stake.skey"


