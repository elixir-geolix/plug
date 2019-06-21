use Mix.Config

if Mix.env() == :test do
  config :geolix,
    databases: [
      %{
        id: :fake,
        adapter: Geolix.Adapter.Fake,
        data: %{{1, 1, 1, 1} => :fake}
      }
    ]
end
