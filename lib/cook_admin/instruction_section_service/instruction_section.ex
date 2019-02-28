defmodule CookAdmin.InstructionSectionService.InstructionSection do
  use Ecto.Schema
  import Ecto.Changeset


  schema "instruction_sections" do
    belongs_to :recipe, CookAdmin.RecipeService.Recipe
    field :name, :string
    field :sequence, :integer

    timestamps()
  end

  @doc false
  def changeset(instruction_section, attrs) do
    instruction_section
    |> cast(attrs, [:recipe_id, :name, :sequence])
    |> validate_required([:recipe_id, :name, :sequence])
  end
end
