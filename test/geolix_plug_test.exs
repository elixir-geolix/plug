defmodule Geolix.PlugTest do
  use ExUnit.Case
  use Plug.Test

  defmodule Router do
    use Plug.Router

    plug Geolix.Plug, where: :fixture_city

    plug :match
    plug :dispatch

    get "/", do: send_resp(conn, 200, "OK")
  end

  @opts Router.init([])

  test "returns 200" do
    conn =
      conn(:get, "/")
      |> Map.put(:remote_ip, {2, 125, 160, 216})
      |> Router.call(@opts)

    assert 200 == conn.status
    assert %Geolix.Result.City{} = conn.private[:geolix]
  end
end
