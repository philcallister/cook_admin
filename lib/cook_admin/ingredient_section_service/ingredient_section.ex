defmodule CookAdmin.IngredientSectionService.IngredientSection do
  use Ecto.Schema
  import Ecto.Changeset


  schema "ingredient_sections" do
    belongs_to :recipe, CookAdmin.RecipeService.Recipe
    field :name, :string
    field :sequence, :integer

    timestamps()
  end

  @doc false
  def changeset(ingredient_section, attrs \\ %{}) do
    ingredient_section
    |> cast(attrs, [:recipe_id, :name, :sequence])
    |> validate_required([:recipe_id, :name, :sequence])
  end
end
