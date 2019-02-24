defmodule CookAdmin.RecipeService.Recipe do
  use Ecto.Schema
  import Ecto.Changeset


  schema "recipes" do
    belongs_to :author, CookAdmin.Admin.Author
    field :calories, :integer
    field :cook_time, :integer
    field :description, :string
    field :featured_pos, :integer
    field :is_featured, :boolean, default: false
    field :name, :string
    field :prep_time, :integer
    field :serves, :integer
    field :short_description, :string

    timestamps()
  end

  @doc false
  def changeset(recipe, attrs \\ %{}) do
    recipe
    |> cast(attrs, [:author_id, :name, :short_description, :description, :serves, :prep_time, :cook_time, :calories, :is_featured, :featured_pos])
    |> validate_required([:author_id, :name, :short_description, :description, :serves, :prep_time, :cook_time, :calories, :is_featured, :featured_pos])
  end
end
