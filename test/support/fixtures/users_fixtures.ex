defmodule InventoryManagement.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `InventoryManagement.Users` context.
  """

  @doc """
  Generate a unique user username.
  """
  def unique_user_username, do: "some username#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        first_name: "some first_name",
        last_name: "some last_name",
        password: "some password",
        username: unique_user_username()
      })
      |> InventoryManagement.Users.create_user()

    user
  end
end
