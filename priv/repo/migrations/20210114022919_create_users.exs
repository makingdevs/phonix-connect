defmodule AmazonConnect.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :number_client, :bigint
      add :phone, :bigint

      timestamps()
    end

  end
end
