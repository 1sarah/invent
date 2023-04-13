defmodule UserResolver do
  alias InventoryManagement.Users

  def login(%{user_login: %{password: password, username: username}}, _resolution) do
    with {:check_login_limit, :allow} <-
           {:check_login_limit, InventoryManagementWeb.Graphql.Helpers.check_rate(username)},
         {:user, {:ok, getUser}} <- {:user, username |> Users.get_user_by_username()} do
      userRet = %{
        username: getUser.username,
        id: getUser.id,
        message: "Your OTP has been sent to your email"
      }

      {:ok, userRet}

      {:ok, token, _} =
        InventoryManagement.Security.Guardian.encode_and_sign(
          userRet,
          [typ: "otp", otpExpiry: 180],
          ttl: {10, :minutes}
        )

      {:ok, Map.put_new(userRet, :token, token)}
    else
      {:user, _} ->
        {:error, "User not found"}

      {:check_login_limit, _} ->
        {:error, %{message: "Sorry your account is locked"}}
    end
  end

  def get_userInfo(_parent, _args, context) do
    with {:auth, %{context: %{current_user: user}}} <- {:auth, context} do
      {:ok, user.resource}
    else
      {:auth, _} ->
        {:error, "You need to auth to use service"}
    end
  end
end
