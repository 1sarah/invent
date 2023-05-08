defmodule ProductResolvers do
  alias InventoryManagement.{Products}

  def list_products(_parent, args, _context) do
    products = Products.list_all_products(args)

    {:ok, %{product: products.result, total: products.total_count}}
  end

  def get_product_by_month(_parent,args,_context)do
     products = Products.group_product_by_month()
     {:ok, products}
  end
end
