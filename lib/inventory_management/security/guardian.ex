defmodule InventoryManagement.Security.Guardian do
  use Guardian, otp_app: :inventory_management
  alias InventoryManagement.Repo

  def subject_for_token(%{id: id}, _claims) do
    # You can use any value for the subject of your token but
    # it should be useful in retrieving the resource later, see
    # how it being used on `resource_from_claims/1` function.
    # A unique `id` is a good subject, a non-unique email address
    # is a poor subject.
    sub = to_string(id)
    {:ok, sub}
  end

  def resource_from_claims(%{"sub" => id}) do
    resource = Repo.get(InventoryManagement.Users.User, id)
    # {user, _} = claims["sub"]
    resource
  end
end
