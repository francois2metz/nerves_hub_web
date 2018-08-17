defmodule NervesHubCore.Accounts.Org do
  use Ecto.Schema

  import Ecto.Changeset

  alias NervesHubCore.Accounts.{User, OrgKey}
  alias NervesHubCore.Devices.Device
  alias NervesHubCore.Products.Product
  alias __MODULE__

  @type t :: %__MODULE__{}

  schema "orgs" do
    has_many(:org_keys, OrgKey)
    has_many(:products, Product)
    has_many(:devices, Device)

    many_to_many(:users, User, join_through: "users_orgs")

    field(:name, :string)

    timestamps()
  end

  def changeset(%Org{} = org, params) do
    org
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
