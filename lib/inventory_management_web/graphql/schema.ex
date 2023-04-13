defmodule InventoryManagementWeb.Graphql.Schema do
    use Absinthe.Schema

    #types
    import_types(InventoryManagementWeb.Graphql.Types.{Inventory,Utils,User,StockLevel})

    #queries
    import_types(InventoryManagementWeb.Graphql.Queries.{Inventory,User})

    #mutations
    import_types(InventoryManagementWeb.Graphql.Mutations.{Inventory,User})

    query do
      import_fields(:product_queries)
      import_fields(:user_queries)

    end

    mutation do
      import_fields(:product_mutations)
      import_fields(:user_mutations)
    end
  end
