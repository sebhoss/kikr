defmodule Kikr.PageControllerTest do
  use Kikr.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to kikr!"
  end
end
