defmodule ElixirChatAppWeb.UserPage do
  use Phoenix.Controller

  def submit_form(conn, %{"username" => username}) do
    conn
    |> Plug.Conn.put_session(:username, username)
    |> Phoenix.Controller.redirect(to: "/chat")
    IO.inspect(username)
  end
end
