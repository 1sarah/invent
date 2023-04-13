defmodule InventoryManagementWeb.Graphql.Loaddata do
  use Absinthe.Schema.Notation
  alias InventoryManagement.Color
  alias InventoryManagement.Product

  def data() do
    Dataloader.Ecto.new(TppcEx.Repo, query: &query/2)
  end

  def query(Color, %{scope: :color}) do
    Color
  end

  def query(Product, %{scope: :product}) do
    Product
  end
end
