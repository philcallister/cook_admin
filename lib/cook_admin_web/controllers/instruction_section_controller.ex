defmodule CookAdminWeb.InstructionSectionController do
  use CookAdminWeb, :controller

  alias CookAdmin.InstructionSectionService
  alias CookAdmin.InstructionSectionService.InstructionSection

  # def index(conn, _params) do
  #   Instruction_sections = InstructionSectionService.list_Instruction_sections()
  #   render(conn, "index.html", Instruction_sections: Instruction_sections)
  # end

  def new(conn, %{"recipe_id" => recipe_id}) do
    changeset = InstructionSectionService.
      change_instruction_section(%InstructionSection{recipe_id: recipe_id})
    render(conn, "new.html", changeset: changeset, recipe_id: recipe_id)
  end

  def create(conn, %{"recipe_id" => recipe_id, "instruction_section" => instruction_section_params}) do
    case InstructionSectionService.create_instruction_section(instruction_section_params) do
      {:ok, instruction_section} ->
        conn
        |> put_flash(:info, "Instruction section created successfully.")
        |> redirect(to: Routes.recipe_instruction_section_path(conn, :show, recipe_id, instruction_section))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, recipe_id: recipe_id)
    end
  end

  def show(conn, %{"id" => id}) do
    instruction_section = InstructionSectionService.get_instruction_section!(id)
    render(conn, "show.html", instruction_section: instruction_section)
  end

  def edit(conn, %{"id" => id}) do
    instruction_section = InstructionSectionService.get_instruction_section!(id)
    changeset = InstructionSectionService.change_instruction_section(instruction_section)
    render(conn, "edit.html", instruction_section: instruction_section, changeset: changeset, recipe_id: instruction_section.recipe_id)
  end

  def update(conn, %{"id" => id, "instruction_section" => instruction_section_params}) do
    instruction_section = InstructionSectionService.get_instruction_section!(id)

    case InstructionSectionService.update_instruction_section(instruction_section, instruction_section_params) do
      {:ok, instruction_section} ->
        conn
        |> put_flash(:info, "Instruction section updated successfully.")
        |> redirect(to: Routes.recipe_instruction_section_path(conn, :show, instruction_section.recipe_id, instruction_section))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", instruction_section: instruction_section, changeset: changeset, recipe_id: instruction_section.recipe_id)
    end
  end

  # @@@@@ Redirect to correct location
  def delete(conn, %{"id" => id}) do
    instruction_section = InstructionSectionService.get_instruction_section!(id)
    {:ok, _instruction_section} = InstructionSectionService.delete_instruction_section(instruction_section)

    conn
    |> put_flash(:info, "Instruction section deleted successfully.")
    |> redirect(to: Routes.recipe_path(conn, :show, instruction_section.recipe_id))
  end
end
