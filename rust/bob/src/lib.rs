pub fn reply(message: &str) -> &str {
    match message.trim() {
        m if is_silence(m) => "Fine. Be that way!",
        m if is_yelling(m) && is_asking(m) => "Calm down, I know what I'm doing!",
        m if is_yelling(m) => "Whoa, chill out!",
        m if is_asking(m) => "Sure.",
        _ => "Whatever.",
    }
}

fn is_silence(message: &str) -> bool {
    message.is_empty()
}

fn is_yelling(message: &str) -> bool {
    message.to_uppercase() == message && message.chars().any(|c| c.is_uppercase())
}

fn is_asking(message: &str) -> bool {
    message.ends_with("?")
}
