defmodule Gestoque.MovementTest do
  use Gestoque.DataCase

  alias Gestoque.Movement

  describe "input" do
    alias Gestoque.Movement.Input

    import Gestoque.MovementFixtures

    @invalid_attrs %{date: nil, user: nil}

    test "list_input/0 returns all input" do
      input = input_fixture()
      assert Movement.list_input() == [input]
    end

    test "get_input!/1 returns the input with given id" do
      input = input_fixture()
      assert Movement.get_input!(input.id) == input
    end

    test "create_input/1 with valid data creates a input" do
      valid_attrs = %{date: ~D[2022-05-12], user: "some user"}

      assert {:ok, %Input{} = input} = Movement.create_input(valid_attrs)
      assert input.date == ~D[2022-05-12]
      assert input.user == "some user"
    end

    test "create_input/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movement.create_input(@invalid_attrs)
    end

    test "update_input/2 with valid data updates the input" do
      input = input_fixture()
      update_attrs = %{date: ~D[2022-05-13], user: "some updated user"}

      assert {:ok, %Input{} = input} = Movement.update_input(input, update_attrs)
      assert input.date == ~D[2022-05-13]
      assert input.user == "some updated user"
    end

    test "update_input/2 with invalid data returns error changeset" do
      input = input_fixture()
      assert {:error, %Ecto.Changeset{}} = Movement.update_input(input, @invalid_attrs)
      assert input == Movement.get_input!(input.id)
    end

    test "delete_input/1 deletes the input" do
      input = input_fixture()
      assert {:ok, %Input{}} = Movement.delete_input(input)
      assert_raise Ecto.NoResultsError, fn -> Movement.get_input!(input.id) end
    end

    test "change_input/1 returns a input changeset" do
      input = input_fixture()
      assert %Ecto.Changeset{} = Movement.change_input(input)
    end
  end
end
