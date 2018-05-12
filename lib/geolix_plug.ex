defmodule Geolix.Plug do
  @moduledoc """
  Geolix Plug
  """

  import Plug.Conn

  @behaviour Plug

  def init(opts), do: opts

  def call(conn, opts) do
    lookup = Geolix.lookup(conn.remote_ip, opts)

    put_private(conn, :geolix, lookup)
  end
end
