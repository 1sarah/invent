defmodule InventoryManagementWeb.Graphql.Types.User do
  use Absinthe.Schema.Notation

  @desc "user object"
  object :user do
    field(:id, :string)
    field(:username, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:inserted_at, :naive_datetime)
    field(:deleted_at, :naive_datetime)
  end

  @desc "user login response"
  object :login_resp do
    field(:username, non_null(:string))
    field(:token, non_null(:string))
    field(:message, :string)
  end

  @desc "user login inputs"
  input_object :user_login_inputs do
    field(:username, non_null(:string))
    field(:password, non_null(:string))
  end

  @desc "user filter object"
  input_object :user_filter do
    field(:name, :string)
    field(:username, :string)
    field(:id, :string)
    import_fields(:pagination)
  end
end
