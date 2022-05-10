defmodule Gestoque.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :category, :string

      timestamps()
    end
  end
end
