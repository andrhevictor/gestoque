defmodule Gestoque.Movement.Input do
  use Ecto.Schema
  import Ecto.Changeset

  schema "input" do
    field :date, :date
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(input, attrs) do
    input
    |> cast(attrs, [:user, :date])
    |> validate_required([:user, :date])
  end
end
