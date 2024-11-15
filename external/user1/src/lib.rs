#[cfg(test)]
mod tests {
    use main::something;

    #[test]
    fn test_1() {
        something(1);
    }

    #[test]
    fn test_else() {
        something(1000);
        something(1001);
    }
}
