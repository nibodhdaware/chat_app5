defmodule ElixirChatApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElixirChatAppWeb.Telemetry,
      # Start the Ecto repository
      ElixirChatApp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirChatApp.PubSub},
      # Start Finch
      {Finch, name: ElixirChatApp.Finch},
      # Start the Endpoint (http/https)
      ElixirChatAppWeb.Endpoint
      # Start a worker by calling: ElixirChatApp.Worker.start_link(arg)
      # {ElixirChatApp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirChatApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirChatAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
