defmodule InventoryManagementWeb.Graphql.Types.Utils do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)

  interface :result_meta do
    field(:total, non_null(:integer))
    field(:success, non_null(:boolean))
  end

  object :page_info do
    field(:has_next_page, :boolean)
    field(:has_previous_page, :boolean)
    field(:start_cursor, :string)
    field(:end_cursor, :string)
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


  @desc "Group result by month object"
  object :result_count_by_month do
    field(:month, :string)
    field(:count, :integer)
  end
end
