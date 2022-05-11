defmodule Gestoque.Stok.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    belongs_to(:categories, Gestoque.Stok.Category, [foreign_key: :category_id])
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :category_id])
    |> validate_required([:name, :description, :category_id])
  end
end
