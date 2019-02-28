defmodule CookAdminWeb.InstructionSectionControllerTest do
  use CookAdminWeb.ConnCase

  alias CookAdmin.IngrstructionSectionService

  @create_attrs %{name: "some name", sequence: 42}
  @update_attrs %{name: "some updated name", sequence: 43}
  @invalid_attrs %{name: nil, sequence: nil}

  def fixture(:instruction_section) do
    {:ok, instruction_section} = IngrstructionSectionService.create_instruction_section(@create_attrs)
    instruction_section
  end

  describe "index" do
    test "lists all instruction_sections", %{conn: conn} do
      conn = get(conn, Routes.instruction_section_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Instruction sections"
    end
  end

  describe "new instruction_section" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.instruction_section_path(conn, :new))
      assert html_response(conn, 200) =~ "New Instruction section"
    end
  end

  describe "create instruction_section" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.instruction_section_path(conn, :create), instruction_section: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.instruction_section_path(conn, :show, id)

      conn = get(conn, Routes.instruction_section_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Instruction section"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.instruction_section_path(conn, :create), instruction_section: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Instruction section"
    end
  end

  describe "edit instruction_section" do
    setup [:create_instruction_section]

    test "renders form for editing chosen instruction_section", %{conn: conn, instruction_section: instruction_section} do
      conn = get(conn, Routes.instruction_section_path(conn, :edit, instruction_section))
      assert html_response(conn, 200) =~ "Edit Instruction section"
    end
  end

  describe "update instruction_section" do
    setup [:create_instruction_section]

    test "redirects when data is valid", %{conn: conn, instruction_section: instruction_section} do
      conn = put(conn, Routes.instruction_section_path(conn, :update, instruction_section), instruction_section: @update_attrs)
      assert redirected_to(conn) == Routes.instruction_section_path(conn, :show, instruction_section)

      conn = get(conn, Routes.instruction_section_path(conn, :show, instruction_section))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, instruction_section: instruction_section} do
      conn = put(conn, Routes.instruction_section_path(conn, :update, instruction_section), instruction_section: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Instruction section"
    end
  end

  describe "delete instruction_section" do
    setup [:create_instruction_section]

    test "deletes chosen instruction_section", %{conn: conn, instruction_section: instruction_section} do
      conn = delete(conn, Routes.instruction_section_path(conn, :delete, instruction_section))
      assert redirected_to(conn) == Routes.instruction_section_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.instruction_section_path(conn, :show, instruction_section))
      end
    end
  end

  defp create_instruction_section(_) do
    instruction_section = fixture(:instruction_section)
    {:ok, instruction_section: instruction_section}
  end
end
