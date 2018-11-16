defmodule EnzymicEngine.Models.CurrentReport do
  use Ecto.Schema
#  import Ecto.Changeset
#  require Logger

#  import Ecto.Query
  alias EnzymicEngine.StatsRepo

#  alias EnzymicEngine.Models.Ad

  schema "current_reports" do
    field :ad_id, :integer
    field :data, :map

    timestamps()
  end
end
