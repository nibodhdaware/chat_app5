defmodule ChatApp5.Repo do
  use Ecto.Repo,
    otp_app: :chat_app5,
    adapter: Ecto.Adapters.MyXQL
end
