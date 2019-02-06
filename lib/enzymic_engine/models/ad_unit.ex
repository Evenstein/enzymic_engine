defmodule EnzymicEngine.Models.AdUnit do
  use Timex
  use Ecto.Schema
  import Ecto.Changeset

  alias EnzymicEngine.Models.Ad

  schema "ad_units" do
    field :auto_optimization, :boolean
    field :created_at, :utc_datetime
    field :sequence, :boolean
    field :sequence_ids, {:array, :string}
    field :ast, :boolean
    has_many :ads, Ad
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

  def ads_count(ad_unit) do
    carousel =
      cond do
        ad_unit.sequence == true ->
          n = length(ad_unit.sequence_ids)
          {n, n, n, n}
        ad_unit.ast == true ->
          {5, 5, 5, 5}
        true ->
          {3, 5, 5, 4}
      end

    {{3, 6, 3, 2, 5, 1, 1}, carousel, carousel, {1, 1, 1, 1, 1, 1}, {1, 1, 1}, {1, 1, 1}, {1, 1, 1}, {5, 10, 10}, {1, 1}, {10, 10, 10}, {5, 10, 10}}
  end

  def content_size(type, size) do
    {
      {"300x250", "300x600", "970x90", "728x90", "320x480", "320x50", "300x50"},
      {"300x250", "300x600", "970x250", "320x480"},
      {"300x250", "300x600", "970x250", "320x480"},
      {"300x250", "300x600", "970x90", "728x90", "970x250", "320x480"},
      {"300x250", "300x600", "320x480"},
      {"300x250", "300x600", "320x480"},
      {"300x250", "300x600", "320x480"},
      {"300x250", "300x600", "970x250"},
      {"300x600", "320x480"},
      {"300x250", "300x600", "970x250"},
      {"300x250", "300x600", "970x250"}
    }
      |> elem(type)
      |> elem(size)
  end
end
