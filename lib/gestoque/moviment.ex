defmodule Gestoque.Moviment do
  @moduledoc """
  The Moviment context.
  """

  import Ecto.Query, warn: false
  alias Gestoque.Repo

  alias Gestoque.Moviment.Input

  @doc """
  Returns the list of inputs.

  ## Examples

      iex> list_inputs()
      [%Input{}, ...]

  """
  def list_inputs do
    Repo.all(Input)
  end

  @doc """
  Gets a single input.

  Raises `Ecto.NoResultsError` if the Input does not exist.

  ## Examples

      iex> get_input!(123)
      %Input{}

      iex> get_input!(456)
      ** (Ecto.NoResultsError)

  """
  def get_input!(id), do: Repo.get!(Input, id)

  @doc """
  Creates a input.

  ## Examples

      iex> create_input(%{field: value})
      {:ok, %Input{}}

      iex> create_input(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_input(attrs \\ %{}) do
    %Input{}
    |> Input.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a input.

  ## Examples

      iex> update_input(input, %{field: new_value})
      {:ok, %Input{}}

      iex> update_input(input, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_input(%Input{} = input, attrs) do
    input
    |> Input.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a input.

  ## Examples

      iex> delete_input(input)
      {:ok, %Input{}}

      iex> delete_input(input)
      {:error, %Ecto.Changeset{}}

  """
  def delete_input(%Input{} = input) do
    Repo.delete(input)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking input changes.

  ## Examples

      iex> change_input(input)
      %Ecto.Changeset{data: %Input{}}

  """
  def change_input(%Input{} = input, attrs \\ %{}) do
    Input.changeset(input, attrs)
  end

  alias Gestoque.Moviment.Itens_Input

  @doc """
  Returns the list of itens_input.

  ## Examples

      iex> list_itens_input()
      [%Itens_Input{}, ...]

  """
  def list_itens_input do
    Repo.all(Itens_Input)
  end

  @doc """
  Gets a single itens__input.

  Raises `Ecto.NoResultsError` if the Itens  input does not exist.

  ## Examples

      iex> get_itens__input!(123)
      %Itens_Input{}

      iex> get_itens__input!(456)
      ** (Ecto.NoResultsError)

  """
  def get_itens__input!(id), do: Repo.get!(Itens_Input, id)

  @doc """
  Creates a itens__input.

  ## Examples

      iex> create_itens__input(%{field: value})
      {:ok, %Itens_Input{}}

      iex> create_itens__input(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_itens__input(attrs \\ %{}) do
    %Itens_Input{}
    |> Itens_Input.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a itens__input.

  ## Examples

      iex> update_itens__input(itens__input, %{field: new_value})
      {:ok, %Itens_Input{}}

      iex> update_itens__input(itens__input, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_itens__input(%Itens_Input{} = itens__input, attrs) do
    itens__input
    |> Itens_Input.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a itens__input.

  ## Examples

      iex> delete_itens__input(itens__input)
      {:ok, %Itens_Input{}}

      iex> delete_itens__input(itens__input)
      {:error, %Ecto.Changeset{}}

  """
  def delete_itens__input(%Itens_Input{} = itens__input) do
    Repo.delete(itens__input)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking itens__input changes.

  ## Examples

      iex> change_itens__input(itens__input)
      %Ecto.Changeset{data: %Itens_Input{}}

  """
  def change_itens__input(%Itens_Input{} = itens__input, attrs \\ %{}) do
    Itens_Input.changeset(itens__input, attrs)
  end
end
