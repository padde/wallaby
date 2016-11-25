defmodule Wallaby.DSL do
  @moduledoc false

  defmacro __using__([]) do
    quote do
      alias Wallaby.StatelessQuery, as: Query
      import Wallaby.Browser
    end
  end
end
