defmodule EnzymicEngine.Repo do
  use Ecto.Repo,
    otp_app: :enzymic_engine,
    adapter: Ecto.Adapters.Postgres
end
