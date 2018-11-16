defmodule EnzymicEngineWeb.PageController do
  use EnzymicEngineWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
