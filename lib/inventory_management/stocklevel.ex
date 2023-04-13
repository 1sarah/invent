defmodule InventoryManagement.StockLevels do
  alias InventoryManagement.StockLevels.StockLevel
  alias InventoryManagement.Repo

  def list_stockLevels do
    Repo.all(StockLevel)
  end

  def get_stockLevel!(id), do: Repo.get!(StockLevel, id)

  def create_stockLevel(attrs \\ %{}) do
    %StockLevel{}
    |> StockLevel.changeset(attrs)
    |> Repo.insert()
  end

  def update_stockLevel(%StockLevel{} = color, attrs) do
    color
    |> StockLevel.changeset(attrs)
    |> Repo.update()
  end


  def delete_stockLevel(%StockLevel{} = stockLevel) do
    Repo.delete(stockLevel)
  end


  def change_stockLevel(%StockLevel{} = stockLevel, attrs \\ %{}) do
    StockLevel.changeset(stockLevel, attrs)
  end
end
