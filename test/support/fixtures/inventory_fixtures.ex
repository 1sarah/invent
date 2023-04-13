defmodule InventoryManagement.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InventoryManagement.Inventory` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        color: "some color",
        name: "some name",
        price: 120.5,
        quantity: 42,
        sku: "some sku"
      })
      |> InventoryManagement.Inventory.create_product()

    product
  end

  @doc """
  Generate a color.
  """
  def color_fixture(attrs \\ %{}) do
    {:ok, color} =
      attrs
      |> Enum.into(%{
        quantity: 42,
        value: "some value"
      })
      |> InventoryManagement.Inventory.create_color()

    color
  end
end
