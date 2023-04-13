defmodule InventoryManagement.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add(:id, :uuid, primary_key: true, null: false)
      add(:product, :string)
      add(:color, :string)
      add(:quantity, :integer)

      timestamps()
    end
  end
end
