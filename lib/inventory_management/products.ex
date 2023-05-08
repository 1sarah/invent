defmodule InventoryManagement.Products do
  use Ecto.Schema

  alias InventoryManagement.Products.Product
  alias InventoryManagement.Repo
  import Ecto.Query

  @spec list_products :: any
  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{data: %Product{}}

  """
  def change_product(%Product{} = product, attrs \\ %{}) do
    Product.changeset(product, attrs)
  end

  def group_product_by_month do
    Product
    |> select([t], %{month: fragment("to_char(?, 'Month')", t.inserted_at), count: count(t.id)})
    |> group_by([t], fragment("to_char(?, 'Month')", t.inserted_at))
    |> Repo.one()
  end

  def list_all_products(args) do
    res =
      args
      |> Enum.reduce(Product, fn
        {:order, order}, query ->
          query |> order_by({^order, :inserted_at})

        {:filter, filter}, query ->
          query |> filter_with(filter)
      end)
      |> Repo.all()

    filter =
      args =
      Map.update!(args, :filter, fn filter ->
        Map.drop(filter, [:limit])
      end)

    %{
      total_count:
        length(
          filter
          |> Enum.reduce(Product, fn
            {:order, order}, query ->
              query |> order_by({^order, :inserted_at})

            {:filter, filter}, query ->
              query |> filter_with(filter)
          end)
          |> Repo.all()
        ),
      result: res
    }
  end

  defp filter_with(query, filter) do
    Enum.reduce(filter, query, fn
      {:name, name}, query ->
        from(q in query, where: ilike(q.name, ^"%#{name}%"))

      {:price, price}, query ->
        from(q in query, where: ilike(q.price, ^"%#{price}%"))

      {:from_date, from_date}, query ->
        from(q in query, where: q.inserted_at >= ^from_date)

      {:id, id}, query ->
        from(q in query, where: q.id == ^id)

      {:to_date, to_date}, query ->
        from(q in query, where: q.inserted_at <= ^to_date)

      {:sku, sku}, query ->
        from(q in query, where: ilike(q.sku, ^"%#{sku}%"))

      {:offset, offset}, query ->
        query |> offset(^"#{offset}")

      {:limit, limit}, query ->
        query |> limit(^"#{limit}")
    end)
  end
end
