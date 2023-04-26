defmodule ProductResolvers do
  alias InventoryManagement.{Products}

  def list_products(_parent, args, _context) do
    products = Products.list_all_products(args)

    edges =
      products
      |> Enum.map(&pagination_edge/1)

    page_info = page_info(products, length(products), args.filter.limit, args.filter.offset)

    {:ok,%{edges: edges, page_info: page_info,total_count: length(products)}}
  end

  defp pagination_edge(item) do
    %{node: item, cursor: item.id}
  end

  defp page_info(items, total, limit, offset) do
    end_cursor = offset + length(items) - 1
    has_next_page = end_cursor < total - 1

    %{end_cursor: end_cursor, has_next_page: has_next_page}
  end
end
