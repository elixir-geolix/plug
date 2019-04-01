{:ok, _} = Application.ensure_all_started(:geolix)

databases = [
  %{
    id: :fake,
    adapter: Geolix.Adapter.Fake,
    data: Map.put(%{}, {1, 1, 1, 1}, :fake)
  }
]

Application.put_env(:geolix, :databases, databases)
Enum.each(databases, &Geolix.load_database/1)

ExUnit.start()
