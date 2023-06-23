defmodule ElixirChatApp.Repo do
  use Ecto.Repo,
    otp_app: :elixir_chat_app,
    adapter: Ecto.Adapters.MyXQL
end
