defmodule Gestoque.Moviment.Input do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inputs" do
    field :date, :date
    field :status, :integer

    timestamps()
  end

  @doc false
  def changeset(input, attrs) do
    input
    |> cast(attrs, [:date, :status])
    |> validate_required([:date, :status])
  end
end
