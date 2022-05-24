defmodule GestoqueWeb.Itens_InputControllerTest do
  use GestoqueWeb.ConnCase

  import Gestoque.MovimentFixtures

  @create_attrs %{name: "some name", qtd: 42}
  @update_attrs %{name: "some updated name", qtd: 43}
  @invalid_attrs %{name: nil, qtd: nil}

  describe "index" do
    test "lists all itens_input", %{conn: conn} do
      conn = get(conn, Routes.itens__input_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Itens input"
    end
  end

  describe "new itens__input" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.itens__input_path(conn, :new))
      assert html_response(conn, 200) =~ "New Itens  input"
    end
  end

  describe "create itens__input" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.itens__input_path(conn, :create), itens__input: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.itens__input_path(conn, :show, id)

      conn = get(conn, Routes.itens__input_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Itens  input"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.itens__input_path(conn, :create), itens__input: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Itens  input"
    end
  end

  describe "edit itens__input" do
    setup [:create_itens__input]

    test "renders form for editing chosen itens__input", %{conn: conn, itens__input: itens__input} do
      conn = get(conn, Routes.itens__input_path(conn, :edit, itens__input))
      assert html_response(conn, 200) =~ "Edit Itens  input"
    end
  end

  describe "update itens__input" do
    setup [:create_itens__input]

    test "redirects when data is valid", %{conn: conn, itens__input: itens__input} do
      conn = put(conn, Routes.itens__input_path(conn, :update, itens__input), itens__input: @update_attrs)
      assert redirected_to(conn) == Routes.itens__input_path(conn, :show, itens__input)

      conn = get(conn, Routes.itens__input_path(conn, :show, itens__input))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, itens__input: itens__input} do
      conn = put(conn, Routes.itens__input_path(conn, :update, itens__input), itens__input: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Itens  input"
    end
  end

  describe "delete itens__input" do
    setup [:create_itens__input]

    test "deletes chosen itens__input", %{conn: conn, itens__input: itens__input} do
      conn = delete(conn, Routes.itens__input_path(conn, :delete, itens__input))
      assert redirected_to(conn) == Routes.itens__input_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.itens__input_path(conn, :show, itens__input))
      end
    end
  end

  defp create_itens__input(_) do
    itens__input = itens__input_fixture()
    %{itens__input: itens__input}
  end
end
