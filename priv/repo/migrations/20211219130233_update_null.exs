defmodule Keisan.Repo.Migrations.UpdateUsernameTables do
  use Ecto.Migration

  def change do
    alter table("users") do
      modify :username, :string, null: false, default: "-"
    end

    execute "UPDATE users SET username=COALESCE(NULLIF(username, NULL), email)"
  end
end
