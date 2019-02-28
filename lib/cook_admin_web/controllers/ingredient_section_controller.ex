defmodule CookAdminWeb.IngredientSectionController do
  use CookAdminWeb, :controller

  alias CookAdmin.IngredientSectionService
  alias CookAdmin.IngredientSectionService.IngredientSection

  # def index(conn, _params) do
  #   ingredient_sections = IngredientSectionService.list_ingredient_sections()
  #   render(conn, "index.html", ingredient_sections: ingredient_sections)
  # end

  def new(conn, %{"recipe_id" => recipe_id}) do
    changeset = IngredientSectionService.
      change_ingredient_section(%IngredientSection{recipe_id: recipe_id})
    render(conn, "new.html", changeset: changeset, recipe_id: recipe_id)
  end

  def create(conn, %{"recipe_id" => recipe_id, "ingredient_section" => ingredient_section_params}) do
    case IngredientSectionService.create_ingredient_section(ingredient_section_params) do
      {:ok, ingredient_section} ->
        conn
        |> put_flash(:info, "Ingredient section created successfully.")
        |> redirect(to: Routes.recipe_ingredient_section_path(conn, :show, recipe_id, ingredient_section))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, recipe_id: recipe_id)
    end
  end

  def show(conn, %{"id" => id}) do
    ingredient_section = IngredientSectionService.get_ingredient_section!(id)
    render(conn, "show.html", ingredient_section: ingredient_section)
  end

  def edit(conn, %{"id" => id}) do
    ingredient_section = IngredientSectionService.get_ingredient_section!(id)
    changeset = IngredientSectionService.change_ingredient_section(ingredient_section)
    render(conn, "edit.html", ingredient_section: ingredient_section, changeset: changeset, recipe_id: ingredient_section.recipe_id)
  end

  def update(conn, %{"id" => id, "ingredient_section" => ingredient_section_params}) do
    ingredient_section = IngredientSectionService.get_ingredient_section!(id)

    case IngredientSectionService.update_ingredient_section(ingredient_section, ingredient_section_params) do
      {:ok, ingredient_section} ->
        conn
        |> put_flash(:info, "Ingredient section updated successfully.")
        |> redirect(to: Routes.recipe_ingredient_section_path(conn, :show, ingredient_section.recipe_id, ingredient_section))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ingredient_section: ingredient_section, changeset: changeset, recipe_id: ingredient_section.recipe_id)
    end
  end

  # @@@@@ Redirect to correct location
  def delete(conn, %{"id" => id}) do
    ingredient_section = IngredientSectionService.get_ingredient_section!(id)
    {:ok, _ingredient_section} = IngredientSectionService.delete_ingredient_section(ingredient_section)

    conn
    |> put_flash(:info, "Ingredient section deleted successfully.")
    |> redirect(to: Routes.recipe_ingredient_section_path(conn, :index))
  end
end
