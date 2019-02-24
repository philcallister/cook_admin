defmodule CookAdmin.Repo do
  use Ecto.Repo,
    otp_app: :cook_admin,
    adapter: Ecto.Adapters.Postgres
end
