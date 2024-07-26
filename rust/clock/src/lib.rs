use std::fmt;

#[derive(Debug, Eq, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

const MINUTES_PER_DAY: i32 = 1440; // 24 * 60

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        normalized(hours * 60 + minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        normalized(self.hours * 60 + self.minutes + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

fn normalized(mut total_minutes: i32) -> Clock {
    total_minutes %= MINUTES_PER_DAY;

    if total_minutes < 0 {
        total_minutes += MINUTES_PER_DAY;
    }

    Clock {
        hours: (total_minutes / 60) % 24,
        minutes: total_minutes % 60,
    }
}
