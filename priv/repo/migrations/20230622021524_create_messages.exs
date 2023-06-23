defmodule ChatApp5.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :m_text, :string
      add :m_author, :string

      timestamps()
    end
  end
end
