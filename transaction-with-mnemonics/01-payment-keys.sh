#!/bin/bash

. ./env

for i in {1..3}

do
  PHRASE_FILE="phrase${i}.prv"

  if [ ! -f $PHRASE_FILE ]; then
      echo "Error: File $PHRASE_FILE not found. Please make sure the file exists."
      exit 1
  fi

  if [ -f "${WALLET_PATH}/payment${i}.skey" ] ; then
      echo "payment${i}.skey already exists"
  else
    # Create root keys
    cardano-address key from-recovery-phrase Shelley < $PHRASE_FILE > root.xsk
    cardano-address key child 1854H/1815H/0H/0/0 < root.xsk > key.xsk

    # Create payment.skey and payment.vkey
    cardano-cli key convert-cardano-address-key --shelley-payment-key --signing-key-file key.xsk --out-file "${WALLET_PATH}/payment${i}.skey"
    cardano-cli key verification-key --signing-key-file "${WALLET_PATH}/payment${i}.skey" --verification-key-file "${WALLET_PATH}/payment${i}.vkey"

    rm key.xsk
    rm root.xsk
  fi

done
