use rand::Rng;

pub fn private_key(p: u64) -> u64 {
    return rand::thread_rng().gen_range(2..p-1);
}

pub fn public_key(p: u64, g: u64, a: u64) -> u64 {
    return modular_exponent(g, a, p);
}

pub fn secret(p: u64, b_pub: u64, a: u64) -> u64 {
    return modular_exponent(b_pub, a, p);
}

fn modular_exponent(base:u64 , exponent:u64 , modulus:u64) -> u64 {
    let mut result = 1;
    let mut base = base % modulus;
    let mut exponent = exponent;

    loop {
        if exponent <= 0 {
            break;
        }

        if exponent % 2 == 1 {
            result = (result * base) % modulus;
        }

        exponent = exponent >> 1;
        base = (base * base) % modulus;
    }

    result
}
