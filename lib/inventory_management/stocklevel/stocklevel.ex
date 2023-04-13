defmodule InventoryManagement.StockLevels.StockLevel do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type :binary_id
  schema "stock_level" do
    field(:quantity, :integer)
    field(:color, :string)
    field(:description, :string)
    belongs_to(:products, InventoryManagement.Products.Product, foreign_key: :product_id)

    timestamps()
  end

  @doc false
  def changeset(stock_level, attrs) do
    stock_level
    |> cast(attrs, [:stock_level, :quantity, :product_id, :color, :description])
    |> validate_required([:stock_level, :quantity, :product_id])
  end
end
