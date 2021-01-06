Geolix.load_database(%{
  id: :fake,
  adapter: Geolix.Adapter.Fake,
  data: %{{1, 1, 1, 1} => :fake}
})

ExUnit.start()
