defmodule InventoryManagementWeb.Graphql.Types.Inventory do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 3]
  alias InventoryManagementWeb.Graphql.Loaddata

  @desc "product object"
  object :product_details do
    field(:id, :string)
    field(:name, :string)
    field(:sku, :string)
    field(:price, :float)

    field(:stock_level, list_of(:color_details),
      resolve: dataloader(Loaddata, :color, args: %{scope: :color})
    )
  end

  @desc "product Result"
  object :product_result do
    import_fields(:result_meta)
    field(:product, non_null(list_of(non_null(:product_details))))
  end

  @desc "Product inputs"
  input_object :product_inputs do
    field(:name, :string)
    field(:sku, :string)
    field(:price, :float)
  end

  input_object :product_inputs_update do
    field(:id, non_null(:string))
    import_fields(:product_inputs)
  end

  @desc "Product filter inputs"
  input_object :product_filter do
    field(:name, :string)
    field(:sku, :string)
    field(:price, :float)
    import_fields(:pagination)
  end
end
