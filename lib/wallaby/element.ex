defmodule Wallaby.Element do
  @moduledoc """
  Common functionality for interacting with DOM elements.
  """

  defstruct [:url, :session_url, :parent, :id, screenshots: []]

  @type url :: String.t
  @type query :: String.t
  @type locator :: Session.t | t
  @type t :: %__MODULE__{
    session_url: url,
    url: url,
    id: String.t,
    screenshots: list,
  }
end
