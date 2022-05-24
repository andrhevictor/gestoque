defmodule Gestoque.MovimentTest do
  use Gestoque.DataCase

  alias Gestoque.Moviment

  describe "inputs" do
    alias Gestoque.Moviment.Input

    import Gestoque.MovimentFixtures

    @invalid_attrs %{date: nil, status: nil}

    test "list_inputs/0 returns all inputs" do
      input = input_fixture()
      assert Moviment.list_inputs() == [input]
    end

    test "get_input!/1 returns the input with given id" do
      input = input_fixture()
      assert Moviment.get_input!(input.id) == input
    end

    test "create_input/1 with valid data creates a input" do
      valid_attrs = %{date: ~D[2022-05-21], status: 42}

      assert {:ok, %Input{} = input} = Moviment.create_input(valid_attrs)
      assert input.date == ~D[2022-05-21]
      assert input.status == 42
    end

    test "create_input/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Moviment.create_input(@invalid_attrs)
    end

    test "update_input/2 with valid data updates the input" do
      input = input_fixture()
      update_attrs = %{date: ~D[2022-05-22], status: 43}

      assert {:ok, %Input{} = input} = Moviment.update_input(input, update_attrs)
      assert input.date == ~D[2022-05-22]
      assert input.status == 43
    end

    test "update_input/2 with invalid data returns error changeset" do
      input = input_fixture()
      assert {:error, %Ecto.Changeset{}} = Moviment.update_input(input, @invalid_attrs)
      assert input == Moviment.get_input!(input.id)
    end

    test "delete_input/1 deletes the input" do
      input = input_fixture()
      assert {:ok, %Input{}} = Moviment.delete_input(input)
      assert_raise Ecto.NoResultsError, fn -> Moviment.get_input!(input.id) end
    end

    test "change_input/1 returns a input changeset" do
      input = input_fixture()
      assert %Ecto.Changeset{} = Moviment.change_input(input)
    end
  end

  describe "itens_input" do
    alias Gestoque.Moviment.Itens_Input

    import Gestoque.MovimentFixtures

    @invalid_attrs %{name: nil, qtd: nil}

    test "list_itens_input/0 returns all itens_input" do
      itens__input = itens__input_fixture()
      assert Moviment.list_itens_input() == [itens__input]
    end

    test "get_itens__input!/1 returns the itens__input with given id" do
      itens__input = itens__input_fixture()
      assert Moviment.get_itens__input!(itens__input.id) == itens__input
    end

    test "create_itens__input/1 with valid data creates a itens__input" do
      valid_attrs = %{name: "some name", qtd: 42}

      assert {:ok, %Itens_Input{} = itens__input} = Moviment.create_itens__input(valid_attrs)
      assert itens__input.name == "some name"
      assert itens__input.qtd == 42
    end

    test "create_itens__input/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Moviment.create_itens__input(@invalid_attrs)
    end

    test "update_itens__input/2 with valid data updates the itens__input" do
      itens__input = itens__input_fixture()
      update_attrs = %{name: "some updated name", qtd: 43}

      assert {:ok, %Itens_Input{} = itens__input} = Moviment.update_itens__input(itens__input, update_attrs)
      assert itens__input.name == "some updated name"
      assert itens__input.qtd == 43
    end

    test "update_itens__input/2 with invalid data returns error changeset" do
      itens__input = itens__input_fixture()
      assert {:error, %Ecto.Changeset{}} = Moviment.update_itens__input(itens__input, @invalid_attrs)
      assert itens__input == Moviment.get_itens__input!(itens__input.id)
    end

    test "delete_itens__input/1 deletes the itens__input" do
      itens__input = itens__input_fixture()
      assert {:ok, %Itens_Input{}} = Moviment.delete_itens__input(itens__input)
      assert_raise Ecto.NoResultsError, fn -> Moviment.get_itens__input!(itens__input.id) end
    end

    test "change_itens__input/1 returns a itens__input changeset" do
      itens__input = itens__input_fixture()
      assert %Ecto.Changeset{} = Moviment.change_itens__input(itens__input)
    end
  end
end
