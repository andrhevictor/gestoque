defmodule GestoqueWeb.Itens_InputController do
  use GestoqueWeb, :controller

  alias Gestoque.Moviment
  alias Gestoque.Moviment.Itens_Input

  def index(conn, _params) do
    itens_input = Moviment.list_itens_input()
    render(conn, "index.html", itens_input: itens_input)
  end

  def new(conn, _params) do
    changeset = Moviment.change_itens__input(%Itens_Input{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"itens__input" => itens__input_params}) do
    case Moviment.create_itens__input(itens__input_params) do
      {:ok, itens__input} ->
        conn
        |> put_flash(:info, "Itens  input created successfully.")
        |> redirect(to: Routes.itens__input_path(conn, :show, itens__input))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    itens__input = Moviment.get_itens__input!(id)
    render(conn, "show.html", itens__input: itens__input)
  end

  def edit(conn, %{"id" => id}) do
    itens__input = Moviment.get_itens__input!(id)
    changeset = Moviment.change_itens__input(itens__input)
    render(conn, "edit.html", itens__input: itens__input, changeset: changeset)
  end

  def update(conn, %{"id" => id, "itens__input" => itens__input_params}) do
    itens__input = Moviment.get_itens__input!(id)

    case Moviment.update_itens__input(itens__input, itens__input_params) do
      {:ok, itens__input} ->
        conn
        |> put_flash(:info, "Itens  input updated successfully.")
        |> redirect(to: Routes.itens__input_path(conn, :show, itens__input))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", itens__input: itens__input, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    itens__input = Moviment.get_itens__input!(id)
    {:ok, _itens__input} = Moviment.delete_itens__input(itens__input)

    conn
    |> put_flash(:info, "Itens  input deleted successfully.")
    |> redirect(to: Routes.itens__input_path(conn, :index))
  end
end
