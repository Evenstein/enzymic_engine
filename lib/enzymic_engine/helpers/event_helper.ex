defmodule EnzymicEngine.Helpers.EventHelper do
  def calculate_client_uid(data) do
    fields = [
      data["user_agent"],
      data["ip"] || '',
      data["ad_unit_size"],
      data["plugins_hash"] || '',
      data["domain_url"] || ''
    ]
    :crypto.hash(:sha, fields)
      |> Base.encode16
  end
end
