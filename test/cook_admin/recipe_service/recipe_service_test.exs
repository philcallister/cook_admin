defmodule CookAdmin.RecipeServiceTest do
  use CookAdmin.DataCase

  alias CookAdmin.RecipeService

  describe "recipes" do
    alias CookAdmin.RecipeService.Recipe

    @valid_attrs %{calories: 42, cook_time: 42, description: "some description", featured_pos: 42, is_featured: true, name: "some name", prep_time: 42, serves: 42, short_description: "some short_description"}
    @update_attrs %{calories: 43, cook_time: 43, description: "some updated description", featured_pos: 43, is_featured: false, name: "some updated name", prep_time: 43, serves: 43, short_description: "some updated short_description"}
    @invalid_attrs %{calories: nil, cook_time: nil, description: nil, featured_pos: nil, is_featured: nil, name: nil, prep_time: nil, serves: nil, short_description: nil}

    def recipe_fixture(attrs \\ %{}) do
      {:ok, recipe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RecipeService.create_recipe()

      recipe
    end

    test "list_recipes/0 returns all recipes" do
      recipe = recipe_fixture()
      assert RecipeService.list_recipes() == [recipe]
    end

    test "get_recipe!/1 returns the recipe with given id" do
      recipe = recipe_fixture()
      assert RecipeService.get_recipe!(recipe.id) == recipe
    end

    test "create_recipe/1 with valid data creates a recipe" do
      assert {:ok, %Recipe{} = recipe} = RecipeService.create_recipe(@valid_attrs)
      assert recipe.calories == 42
      assert recipe.cook_time == 42
      assert recipe.description == "some description"
      assert recipe.featured_pos == 42
      assert recipe.is_featured == true
      assert recipe.name == "some name"
      assert recipe.prep_time == 42
      assert recipe.serves == 42
      assert recipe.short_description == "some short_description"
    end

    test "create_recipe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RecipeService.create_recipe(@invalid_attrs)
    end

    test "update_recipe/2 with valid data updates the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{} = recipe} = RecipeService.update_recipe(recipe, @update_attrs)
      assert recipe.calories == 43
      assert recipe.cook_time == 43
      assert recipe.description == "some updated description"
      assert recipe.featured_pos == 43
      assert recipe.is_featured == false
      assert recipe.name == "some updated name"
      assert recipe.prep_time == 43
      assert recipe.serves == 43
      assert recipe.short_description == "some updated short_description"
    end

    test "update_recipe/2 with invalid data returns error changeset" do
      recipe = recipe_fixture()
      assert {:error, %Ecto.Changeset{}} = RecipeService.update_recipe(recipe, @invalid_attrs)
      assert recipe == RecipeService.get_recipe!(recipe.id)
    end

    test "delete_recipe/1 deletes the recipe" do
      recipe = recipe_fixture()
      assert {:ok, %Recipe{}} = RecipeService.delete_recipe(recipe)
      assert_raise Ecto.NoResultsError, fn -> RecipeService.get_recipe!(recipe.id) end
    end

    test "change_recipe/1 returns a recipe changeset" do
      recipe = recipe_fixture()
      assert %Ecto.Changeset{} = RecipeService.change_recipe(recipe)
    end
  end
end
