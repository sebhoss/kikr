defmodule Kikr.Player do
  use Kikr.Web, :model

  schema "players" do
    field :name, :string
    field :email, :string
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :description])
    |> validate_required([:name, :email])
  end
end
