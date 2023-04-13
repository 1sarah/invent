defmodule InventoryManagement.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password, :string)
    field(:username, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :first_name, :last_name, :password, :email])
    |> validate_required([:username, :first_name, :last_name, :password, :email])
    |> unique_constraint(:username)
  end
end
