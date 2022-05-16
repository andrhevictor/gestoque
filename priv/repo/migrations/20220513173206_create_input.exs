defmodule Gestoque.Repo.Migrations.CreateInput do
  use Ecto.Migration

  def change do
    create table(:input) do
      add :user, :string
      add :date, :date

      timestamps()
    end
  end
end
