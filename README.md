# Geolix Plug

## Package Setup

Add the library as a dependency to your `mix.exs` file:

```elixir
defp deps do
  [
    # ...
    {:geolix_plug, "~> 0.2.0"}
    # ...
  ]
end
```

## Application Setup

### Configuration

Ensure `:geolix` is configured properly. There are no additional configuration steps necessary.

### Plug

To automatically parse a clients IP and enrich the connection you need to add the plug into your current pipeline:

```elixir
defmodule MyRouter do
  use Plug.Router

  # ...
  plug Geolix.Plug, where: :database_id
  # ...

  plug :match
  plug :dispatch
end
```

Depending on how you are using plugs the actual location may vary. Please consult your frameworks documentation to find the proper place.

Once setup the connection will be automatically enriched with the results of a lookup based on the connections `:remote_ip`:

```elixir
defmodule MyRouter do
  get "/" do
    case Geolix.Plug.get_result(conn) do
      nil -> send_resp(404, "No data or lookup failed")
      lookup -> send_resp(200, "Client country: " <> lookup.country.name)
    end
  end
end
```

## License

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
