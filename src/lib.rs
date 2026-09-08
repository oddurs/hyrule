//! Core library behind the `hyrule` command-line tool.

/// Builds the line `hyrule` prints for `name`.
///
/// Leading and trailing whitespace is trimmed; a name that is empty once
/// trimmed falls back to `world`, so `hyrule ""` still prints a sensible line.
///
/// # Examples
///
/// ```
/// assert_eq!(hyrule::greeting("Link"), "Hello, Link!");
/// assert_eq!(hyrule::greeting("  "), "Hello, world!");
/// ```
#[must_use]
pub fn greeting(name: &str) -> String {
    let name = match name.trim() {
        "" => "world",
        trimmed => trimmed,
    };
    format!("Hello, {name}!")
}

#[cfg(test)]
mod tests {
    use super::greeting;

    #[test]
    fn greets_the_given_name() {
        assert_eq!(greeting("Link"), "Hello, Link!");
    }

    #[test]
    fn trims_surrounding_whitespace() {
        assert_eq!(greeting("  Zelda\n"), "Hello, Zelda!");
    }

    #[test]
    fn falls_back_to_world_when_blank() {
        assert_eq!(greeting("   "), "Hello, world!");
    }
}
