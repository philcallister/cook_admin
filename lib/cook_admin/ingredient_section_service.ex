defmodule CookAdmin.IngredientSectionService do
  @moduledoc """
  The IngredientSectionService context.
  """

  import Ecto.Query, warn: false
  alias CookAdmin.Repo

  alias CookAdmin.IngredientSectionService.IngredientSection

  @doc """
  Returns the list of ingredient_sections.

  ## Examples

      iex> list_ingredient_sections()
      [%IngredientSection{}, ...]

  """
  def list_ingredient_sections do
    Repo.all(IngredientSection)
  end

  @doc """
  Gets a single ingredient_section.

  Raises `Ecto.NoResultsError` if the Ingredient section does not exist.

  ## Examples

      iex> get_ingredient_section!(123)
      %IngredientSection{}

      iex> get_ingredient_section!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ingredient_section!(id), do: Repo.get!(IngredientSection, id)

  @doc """
  Creates a ingredient_section.

  ## Examples

      iex> create_ingredient_section(%{field: value})
      {:ok, %IngredientSection{}}

      iex> create_ingredient_section(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ingredient_section(attrs \\ %{}) do
    %IngredientSection{}
    |> IngredientSection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ingredient_section.

  ## Examples

      iex> update_ingredient_section(ingredient_section, %{field: new_value})
      {:ok, %IngredientSection{}}

      iex> update_ingredient_section(ingredient_section, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ingredient_section(%IngredientSection{} = ingredient_section, attrs) do
    ingredient_section
    |> IngredientSection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a IngredientSection.

  ## Examples

      iex> delete_ingredient_section(ingredient_section)
      {:ok, %IngredientSection{}}

      iex> delete_ingredient_section(ingredient_section)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ingredient_section(%IngredientSection{} = ingredient_section) do
    Repo.delete(ingredient_section)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ingredient_section changes.

  ## Examples

      iex> change_ingredient_section(ingredient_section)
      %Ecto.Changeset{source: %IngredientSection{}}

  """
  def change_ingredient_section(%IngredientSection{} = ingredient_section) do
    IngredientSection.changeset(ingredient_section, %{})
  end
end
