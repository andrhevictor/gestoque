defmodule Gestoque.StokTest do
  use Gestoque.DataCase

  alias Gestoque.Stok

  describe "products" do
    alias Gestoque.Stok.Product

    import Gestoque.StokFixtures

    @invalid_attrs %{}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Stok.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Stok.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{}

      assert {:ok, %Product{} = product} = Stok.create_product(valid_attrs)
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stok.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{}

      assert {:ok, %Product{} = product} = Stok.update_product(product, update_attrs)
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Stok.update_product(product, @invalid_attrs)
      assert product == Stok.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Stok.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Stok.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Stok.change_product(product)
    end
  end

  describe "categories" do
    alias Gestoque.Stok.Category

    import Gestoque.StokFixtures

    @invalid_attrs %{}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Stok.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Stok.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{}

      assert {:ok, %Category{} = category} = Stok.create_category(valid_attrs)
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stok.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{}

      assert {:ok, %Category{} = category} = Stok.update_category(category, update_attrs)
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Stok.update_category(category, @invalid_attrs)
      assert category == Stok.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Stok.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Stok.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Stok.change_category(category)
    end
  end

  describe "products" do
    alias Gestoque.Stok.Product

    import Gestoque.StokFixtures

    @invalid_attrs %{category: nil, description: nil, name: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Stok.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Stok.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{category: "some category", description: "some description", name: "some name"}

      assert {:ok, %Product{} = product} = Stok.create_product(valid_attrs)
      assert product.category == "some category"
      assert product.description == "some description"
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stok.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{category: "some updated category", description: "some updated description", name: "some updated name"}

      assert {:ok, %Product{} = product} = Stok.update_product(product, update_attrs)
      assert product.category == "some updated category"
      assert product.description == "some updated description"
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Stok.update_product(product, @invalid_attrs)
      assert product == Stok.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Stok.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Stok.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Stok.change_product(product)
    end
  end
end
