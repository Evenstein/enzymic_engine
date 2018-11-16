defmodule EnzymicEngineWeb.Router do
  use EnzymicEngineWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EnzymicEngineWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/ad_units", AdUnitController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", EnzymicEngineWeb do
  #   pipe_through :api
  # end
end
