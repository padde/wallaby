defmodule Wallaby.Browser.ClearTest do
  use Wallaby.SessionCase, async: true

  test "clearing input", %{session: session} do
    element =
      session
      |> visit("forms.html")
      |> find("#name_field")

    fill_in(element, with: "Chris")
    assert has_value?(element, "Chris")

    clear(element)
    refute has_value?(element, "Chris")
    assert has_value?(element, "")
  end
end
