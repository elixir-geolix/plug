defmodule Geolix.PlugTestHelpers.FixtureList do
  @moduledoc false

  @base_maxmind "https://raw.githubusercontent.com/maxmind/MaxMind-DB/master/test-data"

  @doc """
  Returns a list of all available/downloaded fixtures.

  Each returned entry consists of the following values:

      {
        :name_as_atom,
        "local_filename.mmdb",
        "remote_url"
      }
  """
  @spec get() :: list
  def get() do
    [
      {:fixture_city, "GeoIP2-City-Test.mmdb", "#{@base_maxmind}/GeoIP2-City-Test.mmdb"}
    ]
  end
end
