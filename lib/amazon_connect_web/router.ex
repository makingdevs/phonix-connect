defmodule AmazonConnectWeb.Router do
  use AmazonConnectWeb, :router

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

  scope "/", AmazonConnectWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/users/api/:number_client", UserController, :get
    resources "/users", UserController
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: AmazonConnectWeb.Telemetry
    end
  end
end
