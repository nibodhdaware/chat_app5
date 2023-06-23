defmodule ChatApp5 do
  @moduledoc """
  ChatApp5 keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias ChatApp5.{Repo, Message}
  import Ecto.Query
  import Logger

  def list_messages do
    query = from(m in Message, order_by: [asc: m.inserted_at])
    messages = Repo.all(query)
    {:ok, messages}
  end

  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> handle_errors()
  end

  defp handle_errors(changeset) do
    try do
      # Use Repo.insert!/1 to insert the message into the database
      # This will raise an exception if something goes wrong
      message = Repo.insert!(changeset)
      # The message was successfully inserted.
      IO.puts("Message successfully inserted.")
      {:ok, message}
    rescue
      # Catch any exception and get the error message
      e in Ecto.ChangesetError ->
        error = e.message
        # Log the error to the console.
        error(error)
        # Display an error message to the user.
        IO.puts("Error: #{error}")
        {:error, changeset}
    end
  end

end
