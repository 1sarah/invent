defmodule InventoryManagementWeb.Graphql.Types.StockLevel do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 3]
  alias InventoryManagementWeb.Graphql.Loaddata
  @desc "Color object"
  object :color_details do
    field(:id, :string)
    field(:quantity, :integer)
    field(:color, :string)
    field(:description, :string)

    field(:products, :product_details,
      resolve: dataloader(Loaddata, :products, args: %{scope: :product})
    )
    field(:product_id, :id)
  end

  @desc "Color Result"
  object :color_result do
    import_fields(:result_meta)
    field(:color, non_null(list_of(non_null(:color_details))))
  end

  @desc "Color inputs"
  input_object :color_inputs do
    field(:quantity, :integer)
    field(:color, :string)
    field(:description, :string)
    field(:product_id, :string)
  end

  input_object :color_inputs_update do
    field(:id, non_null(:string))
    import_fields(:color_inputs)
  end

  @desc "Color filter inputs"
  input_object :color_filter do
    field(:id, :string)
    field(:quantity, :integer)
    field(:color, :string)
    field(:description, :string)
    import_fields(:pagination)
  end
end
