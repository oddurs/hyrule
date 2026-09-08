use std::process::Command;

fn hyrule() -> Command {
    Command::new(env!("CARGO_BIN_EXE_hyrule"))
}

fn stdout_of(command: &mut Command) -> String {
    let output = command.output().expect("failed to run the hyrule binary");
    assert!(
        output.status.success(),
        "hyrule exited with {}",
        output.status
    );
    String::from_utf8(output.stdout).expect("hyrule wrote non-UTF-8 to stdout")
}

#[test]
fn greets_the_world_without_arguments() {
    assert_eq!(stdout_of(&mut hyrule()), "Hello, world!\n");
}

#[test]
fn greets_the_name_it_is_given() {
    assert_eq!(stdout_of(hyrule().arg("Link")), "Hello, Link!\n");
}

#[test]
fn reports_its_version() {
    let version = stdout_of(hyrule().arg("--version"));
    assert!(
        version.contains(env!("CARGO_PKG_VERSION")),
        "--version printed {version:?}"
    );
}
