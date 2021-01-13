defmodule AmazonConnectWeb.PageController do
  use AmazonConnectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
