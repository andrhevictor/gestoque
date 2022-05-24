defmodule Gestoque.Repo.Migrations.CreateItensInput do
  use Ecto.Migration

  def change do
    create table(:itens_input) do
      add :name, :string
      add :qtd, :integer
      add :input_id, references(:inputs)

      timestamps()
    end

    create index(:itens_input, [:input_id])
  end
end
