defmodule CookAdminWeb.AuthorView do
  use CookAdminWeb, :view
  alias CookAdmin.Avatar

  def avatar_url(author) do
  	if author.avatar do
	    Avatar.url({author.avatar, author})
	    |> String.replace_prefix("/priv/static", "")
	  end
 	end

end
