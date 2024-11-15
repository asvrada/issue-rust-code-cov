pub fn something(num: i32) {
    match num {
        0 => println!("num is 0"),
        1 => println!("num is 1"),
        _ => println!("num is something else"),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_0() {
        something(0);
    }

    #[test]
    fn test_1() {
        something(1);
    }
}
