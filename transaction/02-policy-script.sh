#!/bin/bash

. env.example

KEYHASH1=$(cardano-cli address key-hash --payment-verification-key-file "${WALLET_PATH}/payment1.vkey")
KEYHASH2=$(cardano-cli address key-hash --payment-verification-key-file "${WALLET_PATH}/payment2.vkey")
KEYHASH3=$(cardano-cli address key-hash --payment-verification-key-file "${WALLET_PATH}/payment3.vkey")

if [ ! -f "${WALLET_PATH}/policy.script" ] ; then
cat << EOF > "${WALLET_PATH}/policy.script"
{
  "type": "all",
  "scripts":
  [
    {
      "type": "sig",
      "keyHash": "${KEYHASH1}"
    },
    {
      "type": "sig",
      "keyHash": "${KEYHASH2}"
    },
    {
      "type": "sig",
      "keyHash": "${KEYHASH3}"
    }
  ]
}
EOF
fi
