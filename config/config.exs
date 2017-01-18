# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :wallaby,
  max_wait_time: 2000,
  pool_size: 3,
  js_logger: :stdio,
  screenshot_on_failure: false,
  js_errors: true,
  driver: Wallaby.Phantom.Driver

import_config "#{Mix.env}.exs"
