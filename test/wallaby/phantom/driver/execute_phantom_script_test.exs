defmodule Wallaby.Phantom.Driver.ExecutePhantomScriptTest do
  use Wallaby.SessionCase, async: true

  def execute_phantom(session, arguments \\ [], script) do
    {:ok, value} = Wallaby.Phantom.Driver.execute_phantom_script(session, script, arguments)
    value
  end

  test "attach alert handler", %{session: session} do
    execute_phantom session, """
      var page = this;
      page.dialogMessages = [];
      page.onAlert = function(msg) {
        page.dialogMessages.push(msg);
      }
    """

    session
    |> visit("alert.html")
    |> click(Query.link("Alert"))

    message = execute_phantom session, """
      return this.dialogMessages.pop();
    """

    assert message == "this is an alert"
  end

  test "attach confirm handler", %{session: session} do
    execute_phantom session, [true], """
    var page = this, returnVal = arguments[0];
    page.dialogMessages = [];
    page.onConfirm = function(msg) {
      page.dialogMessages.push(msg);
      return returnVal;
    }
    """

    session
    |> visit("alert.html")
    |> click(Query.link("Confirm"))

    message = execute_phantom session, """
      return this.dialogMessages.pop();
    """

    assert message == "Are you sure?"

    result =
      session
      |> find(Query.css("#result"))
      |> Element.text

    assert result == "Yes"
  end

  test "attach prompt handler", %{session: session} do
    execute_phantom session, ["Wallaby"], """
      var page = this, returnVal = arguments[0];
      page.dialogMessages = [];
      page.onPrompt = function(msg, defaultVal) {
        page.dialogMessages.push(msg);
        return returnVal || defaultVal;
      }
    """

    session
    |> visit("alert.html")
    |> click(Query.link("Prompt"))

    message = execute_phantom session, """
      return this.dialogMessages.pop();
    """
    assert message == "What's your name?"

    result =
      session
      |> find(Query.css("#result"))
      |> Element.text
    assert result == "Hello Wallaby"
  end
end
