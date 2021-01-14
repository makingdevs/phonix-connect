defmodule AmazonConnect.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:name, :number_client, :phone]}
  schema "users" do
    field :name, :string
    field :number_client, :integer
    field :phone, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :number_client, :phone])
    |> validate_required([:name, :number_client, :phone])
  end
end
