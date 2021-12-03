defmodule Keisan.Repo do
  use Ecto.Repo,
    otp_app: :keisan,
    adapter: Ecto.Adapters.Postgres
end
