defmodule EnzymicEngine.Models.Ad do
  use Ecto.Schema
  import Ecto.Changeset

  alias EnzymicEngine.Models.Video

  schema "ads" do
    field :ad_unit_id, :integer
    field :status, :integer
    has_one :video, Video
  end

  @required_fields ~w()
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
