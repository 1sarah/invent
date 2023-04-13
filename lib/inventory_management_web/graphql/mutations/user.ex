defmodule InventoryManagementWeb.Graphql.Mutations.User do
  use Absinthe.Schema.Notation

  @desc "Create User"
  object :user_mutations do
    @desc "User Login"
    field :auth, type: :login_resp do
      arg(:user_login, non_null(:user_login_inputs))
      resolve(&UserResolver.login/2)
    end
end
end
