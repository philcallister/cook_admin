defmodule CookAdmin.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes) do
      add :name, :string
      add :short_description, :text
      add :description, :text
      add :serves, :integer
      add :prep_time, :integer
      add :cook_time, :integer
      add :calories, :integer
      add :is_featured, :boolean, default: false, null: false
      add :featured_pos, :integer
      add :author_id, references(:authors, on_delete: :nothing)

      timestamps()
    end

    create index(:recipes, [:author_id])
  end
end
