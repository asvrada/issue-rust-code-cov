#!/usr/bin/env bash

ROOT_DIR=$(pwd)

# Build for all
cd ${ROOT_DIR}/external/user1
echo ">>>> Running for user1"
cargo llvm-cov -v

cd ${ROOT_DIR}/workspace
echo ">>>> Running for workspace"
cargo llvm-cov -v

# Merge profdata
cd ${ROOT_DIR}
rm merged.profdata
llvm-profdata-19 merge external/user1/target/llvm-cov-target/user1.profdata workspace/target/llvm-cov-target/workspace.profdata -o merged.profdata

echo ">>>> Report"
llvm-cov-19 report -instr-profile=merged.profdata -object external/user1/target/llvm-cov-target/debug/deps/user1-ed338ffcc7d559f6 workspace/target/llvm-cov-target/debug/deps/main-732a092099ae27f7

echo ">>>> Show summary"
llvm-cov-19 show -instr-profile=merged.profdata -object external/user1/target/llvm-cov-target/debug/deps/user1-ed338ffcc7d559f6 workspace/target/llvm-cov-target/debug/deps/main-732a092099ae27f7

echo ">>>> Saving to HTML..."
llvm-cov-19 show -instr-profile=merged.profdata -format html -object external/user1/target/llvm-cov-target/debug/deps/user1-ed338ffcc7d559f6 workspace/target/llvm-cov-target/debug/deps/main-732a092099ae27f7 > index.html