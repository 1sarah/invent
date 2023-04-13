defmodule InventoryManagementWeb.Graphql.Types.Utils do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  interface :result_meta do
    field(:total, non_null(:integer))
    field(:success, non_null(:boolean))
  end

  enum :sort_order do
    value(:asc)
    value(:desc)
  end

  interface :pagination do
    field(:from_date, :naive_datetime)
    field(:to_date, :naive_datetime)
    field(:offset, :integer, default_value: 0)
    field(:limit, :integer, default_value: 10)
  end

  object :success_message do
    field(:success, :boolean)
    field(:message, :string)
  end
end
