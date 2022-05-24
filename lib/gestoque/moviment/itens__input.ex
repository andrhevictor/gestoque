defmodule Gestoque.Moviment.Itens_Input do
  use Ecto.Schema
  import Ecto.Changeset

  schema "itens_input" do
    belongs_to(:input, Gestoque.Moviment.Intput, [foreign_key: :input_id])
    field :name, :string
    field :qtd, :integer

    timestamps()
  end

  @doc false
  def changeset(itens__input, attrs) do
    itens__input
    |> cast(attrs, [:name, :qtd, :input_id])
    |> validate_required([:name, :qtd, :input_id])
  end
end
