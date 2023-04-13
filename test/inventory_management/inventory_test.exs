defmodule InventoryManagement.InventoryTest do
  use InventoryManagement.DataCase

  alias InventoryManagement.Inventory

  describe "products" do
    alias InventoryManagement.Inventory.Product

    import InventoryManagement.InventoryFixtures

    @invalid_attrs %{color: nil, name: nil, price: nil, quantity: nil, sku: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Inventory.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Inventory.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{color: "some color", name: "some name", price: 120.5, quantity: 42, sku: "some sku"}

      assert {:ok, %Product{} = product} = Inventory.create_product(valid_attrs)
      assert product.color == "some color"
      assert product.name == "some name"
      assert product.price == 120.5
      assert product.quantity == 42
      assert product.sku == "some sku"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{color: "some updated color", name: "some updated name", price: 456.7, quantity: 43, sku: "some updated sku"}

      assert {:ok, %Product{} = product} = Inventory.update_product(product, update_attrs)
      assert product.color == "some updated color"
      assert product.name == "some updated name"
      assert product.price == 456.7
      assert product.quantity == 43
      assert product.sku == "some updated sku"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_product(product, @invalid_attrs)
      assert product == Inventory.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Inventory.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Inventory.change_product(product)
    end
  end

  describe "colors" do
    alias InventoryManagement.Inventory.Color

    import InventoryManagement.InventoryFixtures

    @invalid_attrs %{quantity: nil, value: nil}

    test "list_colors/0 returns all colors" do
      color = color_fixture()
      assert Inventory.list_colors() == [color]
    end

    test "get_color!/1 returns the color with given id" do
      color = color_fixture()
      assert Inventory.get_color!(color.id) == color
    end

    test "create_color/1 with valid data creates a color" do
      valid_attrs = %{quantity: 42, value: "some value"}

      assert {:ok, %Color{} = color} = Inventory.create_color(valid_attrs)
      assert color.quantity == 42
      assert color.value == "some value"
    end

    test "create_color/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_color(@invalid_attrs)
    end

    test "update_color/2 with valid data updates the color" do
      color = color_fixture()
      update_attrs = %{quantity: 43, value: "some updated value"}

      assert {:ok, %Color{} = color} = Inventory.update_color(color, update_attrs)
      assert color.quantity == 43
      assert color.value == "some updated value"
    end

    test "update_color/2 with invalid data returns error changeset" do
      color = color_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_color(color, @invalid_attrs)
      assert color == Inventory.get_color!(color.id)
    end

    test "delete_color/1 deletes the color" do
      color = color_fixture()
      assert {:ok, %Color{}} = Inventory.delete_color(color)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_color!(color.id) end
    end

    test "change_color/1 returns a color changeset" do
      color = color_fixture()
      assert %Ecto.Changeset{} = Inventory.change_color(color)
    end
  end
end
