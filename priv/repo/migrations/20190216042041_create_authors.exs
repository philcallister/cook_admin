defmodule CookAdmin.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :first, :string
      add :last, :string
      add :email, :string
      add :bio, :text
      add :avatar, :string

      timestamps()
    end

  end
end
