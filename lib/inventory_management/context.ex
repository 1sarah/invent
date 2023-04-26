defmodule InventoryManagement.Context do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    case build_context(conn) do
      {:ok, context} ->
        # put_private(conn, :absinthe, %{context: context})
        Absinthe.Plug.put_options(conn, context: context)

      {:error, _reason} ->
        conn

      _ ->
        conn
    end
  end

  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, current_user} <- authorize(token) do
      {:ok, %{current_user: current_user}}
    end
  end

  def authorize(token) do
    case InventoryManagement.Security.Guardian.decode_and_verify(token) do
      {:ok, claims} ->
        case return_user(claims) do
          {:ok, user} ->
            {:ok, user |> Map.put(:context, claims["context"]) |> Map.put(:scope, claims["typ"])}

          value ->
            value
        end

      {:error, reason} ->
        {:error, reason}
    end
  end

  defp return_user(claims) do
    case TppcEx.Guardian.resource_from_claims(claims) do
      {:ok, resource} -> {:ok, resource}
      {:error, reason} -> {:error, reason}
    end
  end
end
