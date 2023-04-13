defmodule InventoryManagementWeb.Graphql.Helpers do
  alias InventoryManagement.Repo
  alias InventoryManagement.Users
  alias InventoryManagement.Users.User
  import Ecto.Query

  def check_rate(username) do
    case Hammer.check_rate("lock_user:#{username}", 60_000, 5) do
      {:allow, _count} ->
        :allow

      {:deny, _limit} ->
        # TODO - lock account of user if it is not locked...
        user = User |> where([u], u.username == ^username) |> Repo.one!()

        lock_user(user)
        :deny
    end
  end

  defp lock_user(user) do
    Users.update_user(user, %{
      # active: false,
      updatedBy: "system",
      updated_at: NaiveDateTime.local_now()
    })
  end

  def pagination_edge(item) do
    %{node: item, cursor: item.id}
  end

  def page_info(items, total_count, limit, offset) do
    end_cursor = offset + length(items) - 1
    has_next_page = end_cursor < total_count - 1

    %{total_count: total_count, end_cursor: end_cursor, has_next_page: has_next_page}
  end
end
