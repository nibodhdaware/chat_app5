defmodule ChatApp5Web.PageController do
  use ChatApp5Web, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def chat(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :chat, layout: false)
  end
end
