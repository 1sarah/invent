defmodule InventoryManagementWeb.Graphql.Mutations.Inventory do
  use Absinthe.Schema.Notation

  object :product_mutations do
    field :create_product, type: :success_message do
      arg(:product, non_null(:product_inputs))
      resolve(&Inventory.Resolvers.delete_product/2)
    end

    field :update_product, type: :success_message do
      arg(:product, non_null(:product_inputs_update))
      resolve(&Inventory.Resolvers.delete_product/2)
    end

    field :delete_product, type: :success_message do
      arg(:id, non_null(:id))
      resolve(&Inventory.Resolvers.delete_product/2)
    end
  end
end
