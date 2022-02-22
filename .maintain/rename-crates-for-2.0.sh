#!/bin/bash

function rust_rename() {
    sed -i "s/$1/$2/g" `grep -Rl --include="*.rs" --include="*.stderr" "$1" *` > /dev/null
}

function cargo_rename() {
    find . -name "Cargo.toml" -exec sed -i "s/\(^\|[^\/]\)$1/\1$2/g" {} \;
}

function rename_gitlabci() {
    sed -i "s/$1/$2/g" .gitlab-ci.yml
}

function rename() {
    old=$(echo $1 | cut -f1 -d\ );
    new=$(echo $1 | cut -f2 -d\ );

    echo "Renaming $old to $new"
    # rename in Cargo.tomls
    cargo_rename $old $new
    rename_gitlabci $old $new
    # and it appears, we have the same syntax in rust files
    rust_rename $old $new

    # but generally we have the snail case syntax in rust files
    old=$(echo $old | sed s/-/_/g );
    new=$(echo $new | sed s/-/_/g );

    echo " > $old to $new"
    rust_rename $old $new
}

TO_RENAME=(
    # OLD-CRATE-NAME NEW-CRATE-NAME

    # post initial rename fixes
    "sc-application-crypto sp-application-crypto"
    "sp-transaction-pool-api sp-transaction-pool"
    "sp-transaction-pool-runtime-api sp-transaction-pool"
    "sp-core-storage sp-storage"
    "transaction-factory node-transaction-factory"
    "sp-finality-granpda sp-finality-grandpa"
    "sp-sesssion sp-session"
    "sp-tracing-pool sp-transaction-pool"
    "sc-basic-authority sc-basic-authorship"
    "sc-api sc-client-api"
    "sc-database sc-client-db"

    # PRIMITIVES
    "axlib-application-crypto sp-application-crypto"
    "axlib-authority-discovery-primitives sp-authority-discovery"
    "axlib-block-builder-runtime-api sp-block-builder"
    "axlib-consensus-aura-primitives sp-consensus-aura"
    "axlib-consensus-babe-primitives sp-consensus-babe"
    "axlib-consensus-common sp-consensus"
    "axlib-consensus-pow-primitives sp-consensus-pow"
    "axlib-primitives sp-core"
    "axlib-debug-derive sp-debug-derive"
    "axlib-primitives-storage sp-storage"
    "axlib-externalities sp-externalities"
    "axlib-finality-grandpa-primitives sp-finality-grandpa"
    "axlib-inherents sp-inherents"
    "axlib-keyring sp-keyring"
    "axlib-offchain-primitives sp-offchain"
    "axlib-panic-handler sp-panic-handler"
    "axlib-phragmen sp-npos-elections"
    "axlib-rpc-primitives sp-rpc"
    "axlib-runtime-interface sp-runtime-interface"
    "axlib-runtime-interface-proc-macro sp-runtime-interface-proc-macro"
    "axlib-runtime-interface-test-wasm sp-runtime-interface-test-wasm"
    "axlib-serializer sp-serializer"
    "axlib-session sp-session"
    "sr-api sp-api"
    "sr-api-proc-macro sp-api-proc-macro"
    "sr-api-test sp-api-test"
    "sr-arithmetic sp-arithmetic"
    "sr-arithmetic-fuzzer sp-arithmetic-fuzzer"
    "sr-io sp-io"
    "sr-primitives sp-runtime"
    "sr-sandbox sp-sandbox"
    "sr-staking-primitives sp-staking"
    "sr-std sp-std"
    "sr-version sp-version"
    "axlib-state-machine sp-state-machine"
    "axlib-transaction-pool-runtime-api sp-transaction-pool"
    "axlib-trie sp-trie"
    "axlib-wasm-interface sp-wasm-interface"

    # # CLIENT
    "axlib-client sc-client"
    "axlib-client-api sc-client-api"
    "axlib-authority-discovery sc-authority-discovery"
    "axlib-basic-authorship sc-basic-authorship"
    "axlib-block-builder sc-block-builder"
    "axlib-chain-spec sc-chain-spec"
    "axlib-chain-spec-derive sc-chain-spec-derive"
    "axlib-cli sc-cli"
    "axlib-consensus-aura sc-consensus-aura"
    "axlib-consensus-babe sc-consensus-babe"
    "axlib-consensus-pow sc-consensus-pow"
    "axlib-consensus-slots sc-consensus-slots"
    "axlib-consensus-uncles sc-consensus-uncles"
    "axlib-client-db sc-client-db"
    "axlib-executor sc-executor"
    "axlib-runtime-test sc-runtime-test"
    "axlib-finality-grandpa sc-finality-grandpa"
    "axlib-keystore sc-keystore"
    "axlib-network sc-network"
    "axlib-offchain sc-offchain"
    "axlib-peerset sc-peerset"
    "axlib-rpc-servers sc-rpc-server"
    "axlib-rpc sc-rpc"
    "axlib-service sc-service"
    "axlib-service-test sc-service-test"
    "axlib-state-db sc-state-db"
    "axlib-telemetry sc-telemetry"
    "axlib-test-primitives sp-test-primitives"
    "axlib-tracing sc-tracing"

);

for rule in "${TO_RENAME[@]}"
do
	rename "$rule";
done
