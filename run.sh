#!/usr/bin/env bash

ROOT_DIR=$(pwd)

# Build for all
cd ${ROOT_DIR}/external/user1
echo ">>>> Running for user1"
cargo clean
cargo llvm-cov clean --workspace
cargo llvm-cov -v

cd ${ROOT_DIR}/workspace
echo ">>>> Running for workspace"
cargo clean
cargo llvm-cov clean --workspace
cargo llvm-cov -v

# Merge profdata
cd ${ROOT_DIR}
rm merged.profdata
llvm-profdata-19 merge -sparse external/user1/target/llvm-cov-target/user1.profdata workspace/target/llvm-cov-target/workspace.profdata -o merged.profdata

echo ">>>> Report"
llvm-cov-19 report -instr-profile=merged.profdata -object external/user1/target/llvm-cov-target/debug/deps/user1-8ff7a5a917b590f9 -object external/user1/target/llvm-cov-target/debug/deps/test_use_something-72e0bf4f6bd7b12e -object workspace/target/llvm-cov-target/debug/deps/main-732a092099ae27f7 -object workspace/target/llvm-cov-target/debug/deps/test_something-abccf290ff487652

echo ">>>> Show summary"
llvm-cov-19 show -instr-profile=merged.profdata -object external/user1/target/llvm-cov-target/debug/deps/user1-8ff7a5a917b590f9 -object external/user1/target/llvm-cov-target/debug/deps/test_use_something-72e0bf4f6bd7b12e -object workspace/target/llvm-cov-target/debug/deps/main-732a092099ae27f7 -object workspace/target/llvm-cov-target/debug/deps/test_something-abccf290ff487652

# echo ">>>> Saving to HTML..."
# llvm-cov-19 show -instr-profile=merged.profdata -format html -object external/user1/target/llvm-cov-target/debug/deps/user1-8ff7a5a917b590f9 -object external/user1/target/llvm-cov-target/debug/deps/test_use_something-72e0bf4f6bd7b12e -object workspace/target/llvm-cov-target/debug/deps/main-732a092099ae27f7 -object workspace/target/llvm-cov-target/debug/deps/test_something-abccf290ff487652 -show-line-counts-or-regions -show-expansions -show-branches=count -output-dir=report