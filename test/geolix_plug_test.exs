defmodule Geolix.PlugTest do
  use ExUnit.Case
  use Plug.Test

  defmodule Router do
    use Plug.Router

    plug Geolix.Plug, where: :city

    plug :match
    plug :dispatch

    get "/", do: send_resp(conn, 200, "OK")
  end

  @opts Router.init([])

  test "returns 200" do
    conn = conn(:get, "/") |> Router.call(@opts)

    assert 200 == conn.status
    refute conn.private[:geolix]
  end
end
