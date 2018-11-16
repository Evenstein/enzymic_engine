defmodule EnzymicEngine.Models.Video do
  use Ecto.Schema
  import Ecto.Changeset

  alias EnzymicEngine.Models.Ad

  schema "videos" do
    field :video_type, :integer
    belongs_to :ad, Ad
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
