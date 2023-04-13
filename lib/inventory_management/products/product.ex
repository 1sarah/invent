defmodule InventoryManagement.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type :binary_id

  schema "products" do
    field(:name, :string)
    field(:price, :float)
    field(:sku, :string)

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :sku, :price])
    |> validate_required([:name, :sku, :price])
  end
end
