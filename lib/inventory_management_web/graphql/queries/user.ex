defmodule InventoryManagementWeb.Graphql.Queries.User do
  use Absinthe.Schema.Notation

  object :user_queries do
    field :get_user_info, :user do
      resolve(&UserResolver.get_userInfo/3)
    end
  end
end
