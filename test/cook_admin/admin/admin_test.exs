defmodule CookAdmin.AdminTest do
  use CookAdmin.DataCase

  alias CookAdmin.Admin

  describe "authors" do
    alias CookAdmin.Admin.Author

    @valid_attrs %{avatar: "some avatar", avatar_directory: "some avatar_directory", bio: "some bio", email: "some email", first: "some first", last: "some last"}
    @update_attrs %{avatar: "some updated avatar", avatar_directory: "some updated avatar_directory", bio: "some updated bio", email: "some updated email", first: "some updated first", last: "some updated last"}
    @invalid_attrs %{avatar: nil, avatar_directory: nil, bio: nil, email: nil, first: nil, last: nil}

    def author_fixture(attrs \\ %{}) do
      {:ok, author} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_author()

      author
    end

    test "list_authors/0 returns all authors" do
      author = author_fixture()
      assert Admin.list_authors() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Admin.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      assert {:ok, %Author{} = author} = Admin.create_author(@valid_attrs)
      assert author.avatar == "some avatar"
      assert author.avatar_directory == "some avatar_directory"
      assert author.bio == "some bio"
      assert author.email == "some email"
      assert author.first == "some first"
      assert author.last == "some last"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      assert {:ok, %Author{} = author} = Admin.update_author(author, @update_attrs)
      assert author.avatar == "some updated avatar"
      assert author.avatar_directory == "some updated avatar_directory"
      assert author.bio == "some updated bio"
      assert author.email == "some updated email"
      assert author.first == "some updated first"
      assert author.last == "some updated last"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_author(author, @invalid_attrs)
      assert author == Admin.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Admin.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Admin.change_author(author)
    end
  end
end
