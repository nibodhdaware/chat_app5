defmodule ElixirChatApp.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :m_author, :string
    field :m_text, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:m_text, :m_author])
    |> validate_required([:m_text, :m_author])
  end
end
