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

  @doc """
  Returns the lookup result from the connection.
  """
  @spec get_result(Plug.Conn.t()) :: nil | map
  def get_result(conn), do: conn.private[:geolix]
end
