defmodule Geolix.Plug do
  @moduledoc """
  Geolix Plug
  """

  @behaviour Plug

  def init(opts), do: opts

  def call(conn, _opts), do: conn
end
