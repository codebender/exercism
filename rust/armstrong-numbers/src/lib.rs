pub fn is_armstrong_number(num: u32) -> bool {
    let num_len = num.to_string().len() as u32;

    let num = num as u64;
    num == num.to_string().chars().fold(0, |acc, x| {
        acc + (x.to_digit(10).unwrap() as u64).pow(num_len)
    })
}
