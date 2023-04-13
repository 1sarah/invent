defmodule ProductResolvers do
  alias InventoryManagement.{Repo,Products}
  import Ecto.Query

  def list_products(_parent, args, context) do
    products = Products.list_all_products(args)
    total_count = length(products)
    edges = products |> Enum.map(InventoryManagementWeb.Graphql.Helpers.pagination_edge())

    %{
      edges: edges,
      page_info:
        InventoryManagementWeb.Graphql.Helpers.page_info(
          products,
          total_count,
          args.limit,
          args.offset
        )
    }
  end
end
