defmodule Wallaby.TestDriver do
  use Supervisor

  @behaviour Wallaby.Driver

  @type parent :: Wallaby.Browser.parent()

  @driver Wallaby.TestDriver.Driver

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      worker(@driver, [[name: @driver]]),
    ]

    supervise(children, strategy: :one_for_one)
  end

  def start_session(opts) do
    GenServer.call(@driver, {:start_session, opts})
  end

  def visit(parent, url) do
    GenServer.call(@driver, {:visit, parent, url})
  end

  def find_elements(parent, {method, selector}) do
    GenServer.call(@driver, {:find_elements, parent, {method, selector}})
  end
end
