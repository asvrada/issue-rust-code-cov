use user1::use_something;

#[test]
fn test_num_1() {
    use_something(1);
}

#[test]
fn test_num_else() {
    use_something(1001);
    use_something(1002);
}
