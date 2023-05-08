defmodule InventoryManagementWeb.Graphql.Queries.Inventory do
  use Absinthe.Schema.Notation

  object :product_queries do
    field :get_all_products, :product_result do
      arg(:filter, :product_filter)
      arg(:order, type: :sort_order, default_value: :desc)
      resolve(&ProductResolvers.list_products/3)
    end

    field :get_product_by_month,:result_count_by_month do
    resolve(&ProductResolvers.get_product_by_month/3)
  end
end
end
