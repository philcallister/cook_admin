defmodule CookAdmin.Repo.Migrations.CreateIngredientSections do
  use Ecto.Migration

  def change do
    create table(:ingredient_sections) do
      add :name, :string
      add :sequence, :integer
      add :recipe_id, references(:recipes, on_delete: :nothing)

      timestamps()
    end

    create index(:ingredient_sections, [:recipe_id])
  end
end
