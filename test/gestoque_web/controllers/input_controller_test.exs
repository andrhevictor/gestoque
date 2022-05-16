defmodule GestoqueWeb.InputControllerTest do
  use GestoqueWeb.ConnCase

  import Gestoque.MovementFixtures

  @create_attrs %{date: ~D[2022-05-12], user: "some user"}
  @update_attrs %{date: ~D[2022-05-13], user: "some updated user"}
  @invalid_attrs %{date: nil, user: nil}

  describe "index" do
    test "lists all input", %{conn: conn} do
      conn = get(conn, Routes.input_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Input"
    end
  end

  describe "new input" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.input_path(conn, :new))
      assert html_response(conn, 200) =~ "New Input"
    end
  end

  describe "create input" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.input_path(conn, :create), input: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.input_path(conn, :show, id)

      conn = get(conn, Routes.input_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Input"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.input_path(conn, :create), input: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Input"
    end
  end

  describe "edit input" do
    setup [:create_input]

    test "renders form for editing chosen input", %{conn: conn, input: input} do
      conn = get(conn, Routes.input_path(conn, :edit, input))
      assert html_response(conn, 200) =~ "Edit Input"
    end
  end

  describe "update input" do
    setup [:create_input]

    test "redirects when data is valid", %{conn: conn, input: input} do
      conn = put(conn, Routes.input_path(conn, :update, input), input: @update_attrs)
      assert redirected_to(conn) == Routes.input_path(conn, :show, input)

      conn = get(conn, Routes.input_path(conn, :show, input))
      assert html_response(conn, 200) =~ "some updated user"
    end

    test "renders errors when data is invalid", %{conn: conn, input: input} do
      conn = put(conn, Routes.input_path(conn, :update, input), input: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Input"
    end
  end

  describe "delete input" do
    setup [:create_input]

    test "deletes chosen input", %{conn: conn, input: input} do
      conn = delete(conn, Routes.input_path(conn, :delete, input))
      assert redirected_to(conn) == Routes.input_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.input_path(conn, :show, input))
      end
    end
  end

  defp create_input(_) do
    input = input_fixture()
    %{input: input}
  end
end
