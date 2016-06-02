defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/(\w)\1*/, string)
    |> Enum.map_join(fn ([section, letter]) ->
      String.length(section)
      |> to_string
      |> Kernel.<>(letter)
    end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/([1-9]+)([A-Z])/, string, capture: :all_but_first)
    |> Enum.map_join(fn ([number, letter]) ->
      String.duplicate(letter, String.to_integer(number))
    end)
  end
end
