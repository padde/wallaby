defmodule Wallaby.Browser.SendTextTest do
  use Wallaby.SessionCase, async: true

  test "sending text", %{session: session} do
    session
    |> visit("forms.html")

    session
    |> find("#name_field")
    |> click

    session
    |> send_text("hello")

    assert session |> find("#name_field") |> has_value?("hello")
  end

  test "sending key presses", %{session: session} do
    session
    |> visit("/")

    session
    |> send_keys([:tab, :enter])

    assert find(session, ".blue")
  end
end
