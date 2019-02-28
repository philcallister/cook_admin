defmodule CookAdmin.IngrstructionSectionServiceTest do
  use CookAdmin.DataCase

  alias CookAdmin.IngrstructionSectionService

  describe "instruction_sections" do
    alias CookAdmin.IngrstructionSectionService.InstructionSection

    @valid_attrs %{name: "some name", sequence: 42}
    @update_attrs %{name: "some updated name", sequence: 43}
    @invalid_attrs %{name: nil, sequence: nil}

    def instruction_section_fixture(attrs \\ %{}) do
      {:ok, instruction_section} =
        attrs
        |> Enum.into(@valid_attrs)
        |> IngrstructionSectionService.create_instruction_section()

      instruction_section
    end

    test "list_instruction_sections/0 returns all instruction_sections" do
      instruction_section = instruction_section_fixture()
      assert IngrstructionSectionService.list_instruction_sections() == [instruction_section]
    end

    test "get_instruction_section!/1 returns the instruction_section with given id" do
      instruction_section = instruction_section_fixture()
      assert IngrstructionSectionService.get_instruction_section!(instruction_section.id) == instruction_section
    end

    test "create_instruction_section/1 with valid data creates a instruction_section" do
      assert {:ok, %InstructionSection{} = instruction_section} = IngrstructionSectionService.create_instruction_section(@valid_attrs)
      assert instruction_section.name == "some name"
      assert instruction_section.sequence == 42
    end

    test "create_instruction_section/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = IngrstructionSectionService.create_instruction_section(@invalid_attrs)
    end

    test "update_instruction_section/2 with valid data updates the instruction_section" do
      instruction_section = instruction_section_fixture()
      assert {:ok, %InstructionSection{} = instruction_section} = IngrstructionSectionService.update_instruction_section(instruction_section, @update_attrs)
      assert instruction_section.name == "some updated name"
      assert instruction_section.sequence == 43
    end

    test "update_instruction_section/2 with invalid data returns error changeset" do
      instruction_section = instruction_section_fixture()
      assert {:error, %Ecto.Changeset{}} = IngrstructionSectionService.update_instruction_section(instruction_section, @invalid_attrs)
      assert instruction_section == IngrstructionSectionService.get_instruction_section!(instruction_section.id)
    end

    test "delete_instruction_section/1 deletes the instruction_section" do
      instruction_section = instruction_section_fixture()
      assert {:ok, %InstructionSection{}} = IngrstructionSectionService.delete_instruction_section(instruction_section)
      assert_raise Ecto.NoResultsError, fn -> IngrstructionSectionService.get_instruction_section!(instruction_section.id) end
    end

    test "change_instruction_section/1 returns a instruction_section changeset" do
      instruction_section = instruction_section_fixture()
      assert %Ecto.Changeset{} = IngrstructionSectionService.change_instruction_section(instruction_section)
    end
  end
end
