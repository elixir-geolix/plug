defmodule Geolix.PlugTest do
  use ExUnit.Case
  use Plug.Test

  defmodule Router do
    use Plug.Router

    plug Geolix.Plug, where: :testdata

    plug :match
    plug :dispatch

    get "/", do: send_resp(conn, 200, "OK")
  end

  @opts Router.init([])

  test "returns 200" do
    conn =
      conn(:get, "/")
      |> Map.put(:remote_ip, {1, 1, 1, 1})
      |> Router.call(@opts)

    assert 200 == conn.status
    refute nil == conn.private[:geolix]
  end
end
