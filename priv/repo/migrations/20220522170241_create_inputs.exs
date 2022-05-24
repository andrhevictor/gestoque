defmodule Gestoque.Repo.Migrations.CreateInputs do
  use Ecto.Migration

  def change do
    create table(:inputs) do
      add :date, :date
      add :status, :integer

      timestamps()
    end
  end
end
