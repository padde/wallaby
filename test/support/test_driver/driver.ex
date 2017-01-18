defmodule Wallaby.TestDriver.Driver do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def init(_opts) do
    state = %{
      session_id: 0,
    }

    {:ok, state}
  end

  def handle_call({:start_session, _opts}, _from, %{session_id: id}=state) do
    new_session = %Wallaby.Session{id: id}
    {:reply, {:ok, new_session}, %{state | session_id: id+1}}
  end

  def handle_call({:visit, session, url}, _from, state) do
    {:reply, {:ok, session}, state}
  end

  def handle_call({:find_elements, {method, selector}}, _from, state) do
    element = %Wallaby.Element{id: selector}
    {:reply, {:ok, element}, state}
  end
end
