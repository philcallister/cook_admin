defmodule CookAdminWeb.IngredientSectionControllerTest do
  use CookAdminWeb.ConnCase

  alias CookAdmin.IngredientSectionService

  @create_attrs %{name: "some name", sequence: 42}
  @update_attrs %{name: "some updated name", sequence: 43}
  @invalid_attrs %{name: nil, sequence: nil}

  def fixture(:ingredient_section) do
    {:ok, ingredient_section} = IngredientSectionService.create_ingredient_section(@create_attrs)
    ingredient_section
  end

  describe "index" do
    test "lists all ingredient_sections", %{conn: conn} do
      conn = get(conn, Routes.ingredient_section_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Ingredient sections"
    end
  end

  describe "new ingredient_section" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.ingredient_section_path(conn, :new))
      assert html_response(conn, 200) =~ "New Ingredient section"
    end
  end

  describe "create ingredient_section" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.ingredient_section_path(conn, :create), ingredient_section: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.ingredient_section_path(conn, :show, id)

      conn = get(conn, Routes.ingredient_section_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Ingredient section"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.ingredient_section_path(conn, :create), ingredient_section: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Ingredient section"
    end
  end

  describe "edit ingredient_section" do
    setup [:create_ingredient_section]

    test "renders form for editing chosen ingredient_section", %{conn: conn, ingredient_section: ingredient_section} do
      conn = get(conn, Routes.ingredient_section_path(conn, :edit, ingredient_section))
      assert html_response(conn, 200) =~ "Edit Ingredient section"
    end
  end

  describe "update ingredient_section" do
    setup [:create_ingredient_section]

    test "redirects when data is valid", %{conn: conn, ingredient_section: ingredient_section} do
      conn = put(conn, Routes.ingredient_section_path(conn, :update, ingredient_section), ingredient_section: @update_attrs)
      assert redirected_to(conn) == Routes.ingredient_section_path(conn, :show, ingredient_section)

      conn = get(conn, Routes.ingredient_section_path(conn, :show, ingredient_section))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, ingredient_section: ingredient_section} do
      conn = put(conn, Routes.ingredient_section_path(conn, :update, ingredient_section), ingredient_section: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Ingredient section"
    end
  end

  describe "delete ingredient_section" do
    setup [:create_ingredient_section]

    test "deletes chosen ingredient_section", %{conn: conn, ingredient_section: ingredient_section} do
      conn = delete(conn, Routes.ingredient_section_path(conn, :delete, ingredient_section))
      assert redirected_to(conn) == Routes.ingredient_section_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.ingredient_section_path(conn, :show, ingredient_section))
      end
    end
  end

  defp create_ingredient_section(_) do
    ingredient_section = fixture(:ingredient_section)
    {:ok, ingredient_section: ingredient_section}
  end
end
