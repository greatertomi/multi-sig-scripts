#!/bin/bash

. ./env

for i in {1..3}

do
  PHRASE_FILE="phrase${i}.prv"

  if [ ! -f $PHRASE_FILE ]; then
      echo "Error: File $PHRASE_FILE not found. Please make sure the file exists."
      exit 1
  fi

  if [ -f "${WALLET_PATH}/stake${i}.skey" ] ; then
    echo "stake${i}.skey already exists"
  else
    # Create root keys
    cardano-address key from-recovery-phrase Shelley < $PHRASE_FILE > root.xsk

    # Create stake.skey and stake.vkey
    cat root.xsk | cardano-address key child 1854H/1815H/0H/2/0 > stake.xprv
    cat stake.xprv | cardano-address key public --with-chain-code > stake.xpub
    KEY=$( cat stake.xprv | bech32 | cut -b -128 )$( cat stake.xpub | bech32)
    rm stake.xprv
    rm stake.xpub

    cat << EOF > "${WALLET_PATH}/stake${i}.skey"
    {
        "type": "StakeExtendedSigningKeyShelley_ed25519_bip32",
        "description": "",
        "cborHex": "5880${KEY}"
    }
EOF

  cardano-cli key verification-key --signing-key-file "${WALLET_PATH}/stake${i}.skey" --verification-key-file stake.evkey
  cardano-cli key non-extended-key --extended-verification-key-file stake.evkey --verification-key-file "${WALLET_PATH}/stake${i}.vkey"
  rm stake.evkey
  rm root.xsk

  fi
done


