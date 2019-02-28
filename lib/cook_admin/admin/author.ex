defmodule CookAdmin.Admin.Author do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset


  schema "authors" do
    field :bio, :string
    field :email, :string
    field :first, :string
    field :last, :string
    field :avatar, CookAdmin.Avatar.Type

    has_many :recipes, CookAdmin.RecipeService.Recipe, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(author, attrs \\ %{}) do
    author
    |> cast(attrs, [:first, :last, :email, :bio])
    |> cast_attachments(attrs, [:avatar])
    |> validate_required([:first, :last, :email, :bio])
  end
end
