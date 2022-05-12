defmodule GestoqueWeb.ProductController do
  use GestoqueWeb, :controller

  alias Gestoque.Stok
  alias Gestoque.Stok.Product

  def index(conn, _params) do
    products = Stok.list_products()
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = Stok.change_product(%Product{})
    categories = Stok.select_category()
    render(conn, "new.html", changeset: changeset, categories: categories)
  end

  def create(conn, %{"product" => product_params}) do
    case Stok.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Produto criado com sucesso.")
        |> redirect(to: Routes.product_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        categories = Stok.select_category()
        render(conn, "new.html", changeset: changeset, categories: categories)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Stok.get_product!(id)
    render(conn, "show.html", product: product)
  end

  def edit(conn, %{"id" => id}) do
    product = Stok.get_product!(id)
    changeset = Stok.change_product(product)
    categories = Stok.select_category()
    render(conn, "edit.html", product: product, changeset: changeset, categories: categories)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Stok.get_product!(id)

    case Stok.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: Routes.product_path(conn, :show, product))

      {:error, %Ecto.Changeset{} = changeset} ->
        categories = Stok.select_category()
        render(conn, "edit.html", product: product, changeset: changeset, categories: categories)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Stok.get_product!(id)
    {:ok, _product} = Stok.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: Routes.product_path(conn, :index))
  end
end
