defmodule InventoryManagement.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type :binary_id

  schema "orders" do
    field(:quantity, :integer)
    field(:color, :string)
    belongs_to(:product, InventoryManagement.Product)
    belongs_to(:user, InventoryManagement.User)

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:product, :color, :quantity])
    |> validate_required([:product, :color, :quantity])
  end
end
