defmodule CookAdmin.Repo.Migrations.CreateInstructionSections do
  use Ecto.Migration

  def change do
    create table(:instruction_sections) do
      add :name, :string
      add :sequence, :integer
      add :recipe_id, references(:recipes, on_delete: :nothing)

      timestamps()
    end

    create index(:instruction_sections, [:recipe_id])
  end
end
