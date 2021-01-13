defmodule AmazonConnectWeb.PageControllerTest do
  use AmazonConnectWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
