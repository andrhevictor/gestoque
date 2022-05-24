defmodule Gestoque.MovementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gestoque.Movement` context.
  """

  @doc """
  Generate a input.
  """
  def input_fixture(attrs \\ %{}) do
    {:ok, input} =
      attrs
      |> Enum.into(%{
        date: ~D[2022-05-12],
        user: "some user"
      })
      |> Gestoque.Movement.create_input()

    input
  end
end
