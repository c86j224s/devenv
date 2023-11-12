use std::error::Error;

use async_trait::async_trait;
use nvim_rs::{compat::tokio::Compat, create::tokio as create, Handler, Neovim};
use rmpv::Value;
use tokio::io::Stdout;

#[derive(Clone)]
struct Calculator {}

impl Calculator {
    fn new() -> Self {
        Self {}
    }

    // Add a vector of numbers.
    fn add(&self, nums: Vec<i64>) -> i64 {
        nums.iter().sum::<i64>()
    }

    // Multiply two numbers.
    fn multiply(&self, p: i64, q: i64) -> i64 {
        p * q
    }
}

enum Messages {
    Add,
    Multiply,
    Ping,
    Unknown(String),
}

impl From<String> for Messages {
    fn from(value: String) -> Self {
        match &value[..] {
            "add" => Self::Add,
            "muliply" => Self::Multiply,
            "ping" => Self::Ping,
            _ => Messages::Unknown(value),
        }
    }
}

#[derive(Clone)]
struct NeovimHandler {
    calculator: Calculator,
}

impl NeovimHandler {
    fn new() -> Self {
        Self {
            calculator: Calculator::new(),
        }
    }
}

#[async_trait]
impl Handler for NeovimHandler {
    type Writer = Compat<Stdout>;

    async fn handle_request(
        &self,
        name: String,
        args: Vec<Value>,
        neovim: Neovim<Compat<Stdout>>,
    ) -> Result<Value, Value> {
        tracing::info!(
            "Received request : name[{}], len(args)[{}], args[{:?}]\"",
            &name,
            args.len(),
            &args
        );

        match name.into() {
            Messages::Add => {
                //do stuff

                tracing::info!("in Add");

                // TODO should extract argument parser to autonomous function
                let nums = if let Value::Array(ref nums) = args[0] {
                    tracing::info!("in Array");
                    nums.iter()
                        .map(|v| {
                            tracing::info!("in Array value : {:?}", v);
                            if let Value::String(s) = v {
                                s.as_str().unwrap_or("").parse::<i64>().unwrap_or(0)
                            } else {
                                0
                            }
                        })
                        .collect::<Vec<i64>>()
                } else {
                    tracing::error!("error!!!!");
                    unimplemented!("");
                };

                tracing::info!("Getting nums");

                let sum = self.calculator.add(nums);

                tracing::info!("Sending response : sum[{}]", sum);

                let neovim = neovim.clone();
                neovim
                    .out_write(&format!("echo \"Sum: {}\"\n", sum))
                    .await
                    .unwrap();

                tracing::info!("Sent response : sum[{}]", sum);

                Ok(Value::Nil)
            }
            Messages::Multiply => {
                let mut nums = args.iter();
                let p = nums.next().unwrap().as_i64().unwrap();
                let q = nums.next().unwrap().as_i64().unwrap();
                let mul = self.calculator.multiply(p, q);
                neovim
                    .command(&format!("echo \"Product: {}\"\n", mul))
                    .await
                    .unwrap();

                Ok(Value::Nil)
            }
            Messages::Ping => Ok(Value::from("pong")),
            Messages::Unknown(ename) => {
                neovim
                    .eval(&format!("echo \"Unknown command: {}\"\n", ename))
                    .await
                    .unwrap();

                Ok(Value::Nil)
            }
        }
    }

    async fn handle_notify(
        &self,
        _name: String,
        _args: Vec<Value>,
        _neovim: Neovim<Compat<Stdout>>,
    ) {
    }
}

#[tokio::main]
async fn main() {
    let logfile = std::fs::File::create("rust-calculator.log").unwrap();
    tracing_subscriber::fmt().with_writer(logfile).init();

    tracing::error!("logfile initialized.");

    let handler = NeovimHandler::new();
    let (nvim, io_handler) = create::new_parent(handler).await;

    tracing::info!("neovim instance created");

    // Any error should probably be logged, as stderr is not visible to users.
    match io_handler.await {
        Err(joinerr) => tracing::error!("Error joining IO loop: '{}'", joinerr),
        Ok(Err(err)) => {
            if !err.is_reader_error() {
                // One last try, since there wasn't an error fwith writing to the stream
                tracing::error!("Error others : '{}'", err);
                nvim.err_writeln(&format!("Error: '{}'", err))
                    .await
                    .unwrap_or_else(|e| {
                        // We could inspect this error to see what was happening, and maybe retry, but
                        // at this point it's probably best to assume the worst and print a friendly
                        // and supportive message to our users
                        eprintln!("Well, dang... '{}'", e);
                    });
            }

            if !err.is_channel_closed() {
                // Closed channel usually means neovim quit itself, or this plugin was told to quit
                // by closing the channel, so it's not always an error condition.
                eprintln!("Error: '{}'", err);

                let mut source = err.source();

                while let Some(e) = source {
                    eprintln!("Caused by: '{}'", e);
                    source = e.source();
                }
            }
        }
        Ok(Ok(())) => {
            // do nothing
            tracing::info!("Ok");
        }
    }

    tracing::warn!("Bye, rust-calculator!");
}
