defmodule InventoryManagement.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add(:id, :uuid, primary_key: true, null: false)
      add(:name, :string)
      add(:sku, :string)
      add(:price, :float)

      timestamps()
    end
  end
end
