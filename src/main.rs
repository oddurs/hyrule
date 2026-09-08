use clap::Parser;

use hyrule::greeting;

/// A prompt library for agentic coding, rendered into the projects that use it.
#[derive(Parser)]
#[command(version, about, long_about = None)]
struct Cli {
    /// Who to greet.
    #[arg(default_value = "world")]
    name: String,
}

fn main() {
    let cli = Cli::parse();
    println!("{}", greeting(&cli.name));
}
