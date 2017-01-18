defmodule Wallaby.Driver do
  @type session :: Wallaby.Session.t
  @type element :: Wallaby.Element.t
  @type method :: Wallaby.StatelessQuery.method
  @type selector :: Wallaby.StatelessQuery.selector
  @type url :: String.t
  @type value :: String.t
               | [any()]

  @opaque query :: {method, selector}

  @callback start_session(any()) :: {:ok, session}
                                  | {:error, any()}
  @callback visit(session, url) :: {:ok, session}
                                 | {:error, any()}
  @callback find_elements(parent, query) :: {:ok, element}
                                          | {:error, any()}
  @callback set_value(element, value) :: {:ok, element}
                                       | {:error, any()}
  @callback send_keys(element, value) :: {:ok, element}
                                       | {:error, any()}
end
