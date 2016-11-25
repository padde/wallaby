defmodule Wallaby.Browser.AttrTest do
  use Wallaby.SessionCase, async: true

  test "can get attributes of an element", %{session: session} do
    class =
      session
      |> visit("/")
      |> find("body")
      |> attr("class")

    assert class == "bootstrap"
  end
end
