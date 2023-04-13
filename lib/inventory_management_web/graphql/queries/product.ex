defmodule InventoryManagementWeb.Graphql.Queries.Inventory do
  use Absinthe.Schema.Notation

  object :product_queries do
    field :get_all_products, :product_connection do
      arg(:filter, :product_filter)
      arg(:order, type: :sort_order, default_value: :desc)
      resolve(&ProductResolvers.list_products/3)
    end
  end
end
