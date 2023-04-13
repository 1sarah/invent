defmodule InventoryManagement.Repo.Migrations.CreateColors do
  use Ecto.Migration

  def change do
    create table(:stock_level, primary_key: false) do
      add(:id, :uuid, primary_key: true, null: false)
      add(:quantity, :integer)
      add(:color, :string)
      add(:description, :string)
      add(:product_id, references(:products, type: :uuid, on_delete: :nothing))

      timestamps()
    end

    create(index(:stock_level, [:product_id]))
  end
end
