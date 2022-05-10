defmodule Gestoque.Repo do
  use Ecto.Repo,
    otp_app: :gestoque,
    adapter: Ecto.Adapters.Postgres
end
