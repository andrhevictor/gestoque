defmodule Gestoque.MovimentFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gestoque.Moviment` context.
  """

  @doc """
  Generate a input.
  """
  def input_fixture(attrs \\ %{}) do
    {:ok, input} =
      attrs
      |> Enum.into(%{
        date: ~D[2022-05-21],
        status: 42
      })
      |> Gestoque.Moviment.create_input()

    input
  end

  @doc """
  Generate a itens__input.
  """
  def itens__input_fixture(attrs \\ %{}) do
    {:ok, itens__input} =
      attrs
      |> Enum.into(%{
        name: "some name",
        qtd: 42
      })
      |> Gestoque.Moviment.create_itens__input()

    itens__input
  end
end
