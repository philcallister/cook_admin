defmodule CookAdminWeb.AuthorController do
  use CookAdminWeb, :controller

  alias CookAdmin.Avatar
  alias CookAdmin.Admin
  alias CookAdmin.Admin.Author

  def index(conn, _params) do
    authors = Admin.list_authors()
    render(conn, "index.html", authors: authors)
  end

  def new(conn, _params) do
    changeset = Admin.change_author(%Author{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"author" => author_params}) do
    avatar = author_params["avatar"]
    author_no_avatar = Map.delete(author_params, "avatar")
    case Admin.create_author(author_no_avatar) do
      {:ok, author} ->
        Admin.update_author(author, %{avatar: avatar})
        conn
        |> put_flash(:info, "Author created successfully.")
        |> redirect(to: Routes.author_path(conn, :show, author))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    author = Admin.get_author!(id)
    render(conn, "show.html", author: author)
  end

  def edit(conn, %{"id" => id}) do
    author = Admin.get_author!(id)
    changeset = Admin.change_author(author)
    render(conn, "edit.html", author: author, changeset: changeset)
  end

  def update(conn, %{"id" => id, "author" => author_params}) do
    author = Admin.get_author!(id)
    if author_params[:avatar] do
      delete_existing_avatar(author)
    end

    case Admin.update_author(author, author_params) do
      {:ok, author} ->
        conn
        |> put_flash(:info, "Author updated successfully.")
        |> redirect(to: Routes.author_path(conn, :show, author))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", author: author, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    author = Admin.get_author!(id)
    delete_existing_avatar(author)
    {:ok, _author} = Admin.delete_author(author)

    conn
    |> put_flash(:info, "Author deleted successfully.")
    |> redirect(to: Routes.author_path(conn, :index))
  end

  defp delete_existing_avatar(author) do
    if author.avatar do
      Avatar.delete({author.avatar, author})
    end
  end

end
