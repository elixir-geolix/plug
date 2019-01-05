defmodule Geolix.Plug do
  @moduledoc """
  Geolix Plug

  ## Usage

  After ensuring `:geolix` is configured you need to add the plug:

      defmodule MyRouter do
        use Plug.Router

        # ...
        plug Geolix.Plug, where: :database_id
        # ...

        plug :match
        plug :dispatch
      end

  Depending on how you are using plugs the actual location may vary.
  Please consult your frameworks documentation to find the proper place.

  Once setup the connection will be automatically enriched with the results of
  a lookup based on the connections `:remote_ip`:

      defmodule MyRouter do
        get "/" do
          case Geolix.Plug.get_result(conn) do
            nil -> send_resp(404, "No data or lookup failed")
            lookup -> send_resp(200, "Client country: #{lookup.country.name}")
          end
        end
      end
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
