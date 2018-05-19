{:ok, _} = Application.ensure_all_started(:geolix)

databases = [
  %{
    id: :testdata,
    adapter: Geolix.Adapter.MMDB2,
    source: Path.join([Geolix.TestData.dir(:mmdb2), "Geolix.mmdb"])
  }
]

Application.put_env(:geolix, :databases, databases)
Enum.each(databases, &Geolix.load_database/1)

ExUnit.start()
