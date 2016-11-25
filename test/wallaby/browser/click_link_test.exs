defmodule Wallaby.Browser.ClickLinkTest do
  use Wallaby.SessionCase, async: true

  test "click through to another page", %{session: session} do
    session
    |> visit("")
    |> click_link("Page 1")

    element =
      session
      |> find(".blue")

    assert element
  end
end
