defmodule CookAdmin.InstructionSectionService do
  @moduledoc """
  The InstructionSectionService context.
  """

  import Ecto.Query, warn: false
  alias CookAdmin.Repo

  alias CookAdmin.InstructionSectionService.InstructionSection

  @doc """
  Returns the list of instruction_sections.

  ## Examples

      iex> list_instruction_sections()
      [%InstructionSection{}, ...]

  """
  def list_instruction_sections do
    Repo.all(InstructionSection)
  end

  @doc """
  Gets a single instruction_section.

  Raises `Ecto.NoResultsError` if the Instruction section does not exist.

  ## Examples

      iex> get_instruction_section!(123)
      %InstructionSection{}

      iex> get_instruction_section!(456)
      ** (Ecto.NoResultsError)

  """
  def get_instruction_section!(id), do: Repo.get!(InstructionSection, id)

  @doc """
  Creates a instruction_section.

  ## Examples

      iex> create_instruction_section(%{field: value})
      {:ok, %InstructionSection{}}

      iex> create_instruction_section(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_instruction_section(attrs \\ %{}) do
    %InstructionSection{}
    |> InstructionSection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a instruction_section.

  ## Examples

      iex> update_instruction_section(instruction_section, %{field: new_value})
      {:ok, %InstructionSection{}}

      iex> update_instruction_section(instruction_section, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_instruction_section(%InstructionSection{} = instruction_section, attrs) do
    instruction_section
    |> InstructionSection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a InstructionSection.

  ## Examples

      iex> delete_instruction_section(instruction_section)
      {:ok, %InstructionSection{}}

      iex> delete_instruction_section(instruction_section)
      {:error, %Ecto.Changeset{}}

  """
  def delete_instruction_section(%InstructionSection{} = instruction_section) do
    Repo.delete(instruction_section)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking instruction_section changes.

  ## Examples

      iex> change_instruction_section(instruction_section)
      %Ecto.Changeset{source: %InstructionSection{}}

  """
  def change_instruction_section(%InstructionSection{} = instruction_section) do
    InstructionSection.changeset(instruction_section, %{})
  end
end
