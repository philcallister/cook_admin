defmodule CookAdminWeb.PageController do
  use CookAdminWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
