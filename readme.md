```
./run.sh
>>>> Running for user1
info: cargo-llvm-cov currently setting cfg(coverage); you can opt-out it by passing --no-cfg-coverage
     Running `/home/jeff/.msrustup/packages/rust.tools-x86_64-unknown-linux-gnu.1.82.0-ms-20241018.3/tools/bin/cargo test --tests --manifest-path external/user1/Cargo.toml --target-dir external/user1/target/llvm-cov-target`
   Compiling user1 v0.1.0 (external/user1)
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.47s
     Running unittests src/lib.rs (target/llvm-cov-target/debug/deps/user1-8ff7a5a917b590f9)

running 2 tests
test tests::test_1 ... ok
test tests::test_else ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running `/home/jeff/.msrustup/packages/rust.tools-x86_64-unknown-linux-gnu.1.82.0-ms-20241018.3/tools/lib/rustlib/x86_64-unknown-linux-gnu/bin/llvm-profdata merge -sparse -f external/user1/target/llvm-cov-target/user1-profraw-list -o external/user1/target/llvm-cov-target/user1.profdata`
     Running `/home/jeff/.msrustup/packages/rust.tools-x86_64-unknown-linux-gnu.1.82.0-ms-20241018.3/tools/lib/rustlib/x86_64-unknown-linux-gnu/bin/llvm-cov report -instr-profile=external/user1/target/llvm-cov-target/user1.profdata -object target/llvm-cov-target/debug/deps/user1-8ff7a5a917b590f9 -ignore-filename-regex '/rustc/([0-9a-f]+|[0-9]+\.[0-9]+\.[0-9]+)/|^external/user1(/.*)?/(tests|examples|benches)/|^external/user1/target/llvm\-cov\-target($|/)|^/home/jeff/\.cargo/(registry|git)/|^/home/jeff/\.rustup/toolchains($|/)'`
Filename                      Regions    Missed Regions     Cover   Functions  Missed Functions  Executed       Lines      Missed Lines     Cover    Branches   Missed Branches     Cover
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
external/user1/src/lib.rs           2                 0   100.00%           2                 0   100.00%           7                 0   100.00%           0                 0         -
workspace/main/src/lib.rs           5                 1    80.00%           1                 0   100.00%           6                 1    83.33%           0                 0         -
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TOTAL                               7                 1    85.71%           3                 0   100.00%          13                 1    92.31%           0                 0         -
>>>> Running for workspace
info: cargo-llvm-cov currently setting cfg(coverage); you can opt-out it by passing --no-cfg-coverage
     Running `/home/jeff/.msrustup/packages/rust.tools-x86_64-unknown-linux-gnu.1.82.0-ms-20241018.3/tools/bin/cargo test --tests --manifest-path workspace/Cargo.toml --target-dir workspace/target/llvm-cov-target`
   Compiling main v0.1.0 (workspace/main)
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.43s
     Running unittests src/lib.rs (target/llvm-cov-target/debug/deps/main-732a092099ae27f7)

running 2 tests
test tests::test_0 ... ok
test tests::test_1 ... ok

test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running `/home/jeff/.msrustup/packages/rust.tools-x86_64-unknown-linux-gnu.1.82.0-ms-20241018.3/tools/lib/rustlib/x86_64-unknown-linux-gnu/bin/llvm-profdata merge -sparse -f workspace/target/llvm-cov-target/workspace-profraw-list -o workspace/target/llvm-cov-target/workspace.profdata`
     Running `/home/jeff/.msrustup/packages/rust.tools-x86_64-unknown-linux-gnu.1.82.0-ms-20241018.3/tools/lib/rustlib/x86_64-unknown-linux-gnu/bin/llvm-cov report -instr-profile=workspace/target/llvm-cov-target/workspace.profdata -object target/llvm-cov-target/debug/deps/main-732a092099ae27f7 -ignore-filename-regex '/rustc/([0-9a-f]+|[0-9]+\.[0-9]+\.[0-9]+)/|^workspace(/.*)?/(tests|examples|benches)/|^workspace/target/llvm\-cov\-target($|/)|^/home/jeff/\.cargo/(registry|git)/|^/home/jeff/\.rustup/toolchains($|/)'`
Filename                                                          Regions    Missed Regions     Cover   Functions  Missed Functions  Executed       Lines      Missed Lines     Cover    Branches   Missed Branches     Cover
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
workspace/main/src/lib.rs           7                 1    85.71%           3                 0   100.00%          12                 1    91.67%           0                 0         -
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TOTAL                                                                   7                 1    85.71%           3                 0   100.00%          12                 1    91.67%           0                 0         -
>>>> Report
Filename                      Regions    Missed Regions     Cover   Functions  Missed Functions  Executed       Lines      Missed Lines     Cover    Branches   Missed Branches     Cover
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
external/user1/src/lib.rs           2                 0   100.00%           2                 0   100.00%           7                 0   100.00%           0                 0         -
workspace/main/src/lib.rs           7                 1    85.71%           3                 0   100.00%          12                 1    91.67%           0                 0         -
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
TOTAL                               9                 1    88.89%           5                 0   100.00%          19                 1    94.74%           0                 0         -
>>>> Show summary
external/user1/src/lib.rs:
    1|       |#[cfg(test)]
    2|       |mod tests {
    3|       |    use main::something;
    4|       |
    5|       |    #[test]
    6|      1|    fn test_1() {
    7|      1|        something(1);
    8|      1|    }
    9|       |
   10|       |    #[test]
   11|      1|    fn test_else() {
   12|      1|        something(1000);
   13|      1|        something(1001);
   14|      1|    }
   15|       |}

workspace/main/src/lib.rs:
    1|      5|pub fn something(num: i32) {
    2|      5|    match num {
    3|      1|        0 => println!("num is 0"),
    4|      2|        1 => println!("num is 1"),
    5|      2|        _ => println!("num is something else"),
    6|       |    }
    7|      5|}
  ------------------
  | _RNvCslz5HgPIOMmZ_4main9something:
  |    1|      2|pub fn something(num: i32) {
  |    2|      2|    match num {
  |    3|      1|        0 => println!("num is 0"),
  |    4|      1|        1 => println!("num is 1"),
  |    5|      0|        _ => println!("num is something else"),
  |    6|       |    }
  |    7|      2|}
  ------------------
  | _RNvCskH4GoQYqg9I_4main9something:
  |    1|      3|pub fn something(num: i32) {
  |    2|      3|    match num {
  |    3|      0|        0 => println!("num is 0"),
  |    4|      1|        1 => println!("num is 1"),
  |    5|      2|        _ => println!("num is something else"),
  |    6|       |    }
  |    7|      3|}
  ------------------
    8|       |
    9|       |#[cfg(test)]
   10|       |mod tests {
   11|       |    use super::*;
   12|       |
   13|       |    #[test]
   14|      1|    fn test_0() {
   15|      1|        something(0);
   16|      1|    }
   17|       |
   18|       |    #[test]
   19|      1|    fn test_1() {
   20|      1|        something(1);
   21|      1|    }
   22|       |}
```