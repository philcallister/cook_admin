defmodule CookAdmin.IngredientSectionServiceTest do
  use CookAdmin.DataCase

  alias CookAdmin.IngredientSectionService

  describe "ingredient_sections" do
    alias CookAdmin.IngredientSectionService.IngredientSection

    @valid_attrs %{name: "some name", sequence: 42}
    @update_attrs %{name: "some updated name", sequence: 43}
    @invalid_attrs %{name: nil, sequence: nil}

    def ingredient_section_fixture(attrs \\ %{}) do
      {:ok, ingredient_section} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IngredientSectionService.create_ingredient_section()

      ingredient_section
    end

    test "list_ingredient_sections/0 returns all ingredient_sections" do
      ingredient_section = ingredient_section_fixture()
      assert IngredientSectionService.list_ingredient_sections() == [ingredient_section]
    end

    test "get_ingredient_section!/1 returns the ingredient_section with given id" do
      ingredient_section = ingredient_section_fixture()
      assert IngredientSectionService.get_ingredient_section!(ingredient_section.id) == ingredient_section
    end

    test "create_ingredient_section/1 with valid data creates a ingredient_section" do
      assert {:ok, %IngredientSection{} = ingredient_section} = IngredientSectionService.create_ingredient_section(@valid_attrs)
      assert ingredient_section.name == "some name"
      assert ingredient_section.sequence == 42
    end

    test "create_ingredient_section/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IngredientSectionService.create_ingredient_section(@invalid_attrs)
    end

    test "update_ingredient_section/2 with valid data updates the ingredient_section" do
      ingredient_section = ingredient_section_fixture()
      assert {:ok, %IngredientSection{} = ingredient_section} = IngredientSectionService.update_ingredient_section(ingredient_section, @update_attrs)
      assert ingredient_section.name == "some updated name"
      assert ingredient_section.sequence == 43
    end

    test "update_ingredient_section/2 with invalid data returns error changeset" do
      ingredient_section = ingredient_section_fixture()
      assert {:error, %Ecto.Changeset{}} = IngredientSectionService.update_ingredient_section(ingredient_section, @invalid_attrs)
      assert ingredient_section == IngredientSectionService.get_ingredient_section!(ingredient_section.id)
    end

    test "delete_ingredient_section/1 deletes the ingredient_section" do
      ingredient_section = ingredient_section_fixture()
      assert {:ok, %IngredientSection{}} = IngredientSectionService.delete_ingredient_section(ingredient_section)
      assert_raise Ecto.NoResultsError, fn -> IngredientSectionService.get_ingredient_section!(ingredient_section.id) end
    end

    test "change_ingredient_section/1 returns a ingredient_section changeset" do
      ingredient_section = ingredient_section_fixture()
      assert %Ecto.Changeset{} = IngredientSectionService.change_ingredient_section(ingredient_section)
    end
  end
end
