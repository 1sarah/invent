defmodule InventoryManagement.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:id, :uuid, primary_key: true, null: false)
      add(:username, :string)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:password, :string)
      add(:email, :string)

      timestamps()
    end

    create(unique_index(:users, [:username]))
  end
end
