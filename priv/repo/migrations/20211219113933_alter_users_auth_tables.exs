defmodule Keisan.Repo.Migrations.UpdateUsernameTables do
  use Ecto.Migration

  def change do
    alter table("users") do
      modify :username, :string, default: "-"
    end

    # execute "UPDATE users SET username=COALESCE(NULL, email)"
    execute "ISNULL(username, UPDATE users SET username=email)"

    create unique_index(:users, [:username])
  end
end
