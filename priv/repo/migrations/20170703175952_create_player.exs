defmodule Kikr.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :email, :string
      add :description, :string

      timestamps()
    end

  end
end
