defmodule GestoqueWeb.InputController do
  use GestoqueWeb, :controller

  alias Gestoque.Moviment
  alias Gestoque.Moviment.Input

  def index(conn, _params) do
    inputs = Moviment.list_inputs()
    render(conn, "index.html", inputs: inputs)
  end

  def new(conn, _params) do
    changeset = Moviment.change_input(%Input{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"input" => input_params}) do
    case Moviment.create_input(input_params) do
      {:ok, input} ->
        conn
        |> put_flash(:info, "Input created successfully.")
        |> redirect(to: Routes.input_path(conn, :show, input))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    input = Moviment.get_input!(id)
    render(conn, "show.html", input: input)
  end

  def edit(conn, %{"id" => id}) do
    input = Moviment.get_input!(id)
    changeset = Moviment.change_input(input)
    render(conn, "edit.html", input: input, changeset: changeset)
  end

  def update(conn, %{"id" => id, "input" => input_params}) do
    input = Moviment.get_input!(id)

    case Moviment.update_input(input, input_params) do
      {:ok, input} ->
        conn
        |> put_flash(:info, "Input updated successfully.")
        |> redirect(to: Routes.input_path(conn, :show, input))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", input: input, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    input = Moviment.get_input!(id)
    {:ok, _input} = Moviment.delete_input(input)

    conn
    |> put_flash(:info, "Input deleted successfully.")
    |> redirect(to: Routes.input_path(conn, :index))
  end
end
