defmodule Wallaby.Browser.CurrentPathTest do
  use Wallaby.SessionCase, async: true

  test "gets the current_url of the session", %{session: session}  do
    current_url =
      session
      |> visit("")
      |> click_link("Page 1")
      |> get_current_url

    assert current_url == "http://localhost:#{URI.parse(current_url).port}/page_1.html"
  end

  test "gets the current_path of the session", %{session: session}  do
    current_path =
      session
      |> visit("")
      |> click_link("Page 1")
      |> get_current_path

    assert current_path == "/page_1.html"
  end
end
