defmodule CookAdminWeb.RecipeController do
  use CookAdminWeb, :controller

  alias CookAdmin.RecipeService
  alias CookAdmin.RecipeService.Recipe
  alias CookAdmin.Admin
  alias CookAdmin.Admin.Author
  alias CookAdmin.Repo

  def index(conn, _params) do
    recipes = RecipeService.list_recipes()
    render(conn, "index.html", recipes: recipes)
  end

  def new(conn, _params) do
    authors = Admin.list_authors
    changeset = RecipeService.change_recipe(%Recipe{})
    render(conn, "new.html", changeset: changeset, authors: authors)
  end

  def create(conn, %{"recipe" => recipe_params}) do
    case RecipeService.create_recipe(recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe created successfully.")
        |> redirect(to: Routes.recipe_path(conn, :show, recipe))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = RecipeService.get_recipe!(id)
    render(conn, "show.html", recipe: recipe)
  end

  def edit(conn, %{"id" => id}) do
    authors = Admin.list_authors
    recipe = RecipeService.get_recipe!(id) |> Repo.preload(:author)
    changeset = RecipeService.change_recipe(recipe)
    render(conn, "edit.html", recipe: recipe, changeset: changeset, authors: authors)
  end

  def update(conn, %{"id" => id, "recipe" => recipe_params}) do
    recipe = RecipeService.get_recipe!(id)

    case RecipeService.update_recipe(recipe, recipe_params) do
      {:ok, recipe} ->
        conn
        |> put_flash(:info, "Recipe updated successfully.")
        |> redirect(to: Routes.recipe_path(conn, :show, recipe))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", recipe: recipe, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    recipe = RecipeService.get_recipe!(id)
    {:ok, _recipe} = RecipeService.delete_recipe(recipe)

    conn
    |> put_flash(:info, "Recipe deleted successfully.")
    |> redirect(to: Routes.recipe_path(conn, :index))
  end
end
