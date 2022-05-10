defmodule Gestoque.StokFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gestoque.Stok` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{

      })
      |> Gestoque.Stok.create_product()

    product
  end

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{

      })
      |> Gestoque.Stok.create_category()

    category
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        category: "some category",
        description: "some description",
        name: "some name"
      })
      |> Gestoque.Stok.create_product()

    product
  end
end
