defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    String.split(string, ~r/\s+|.(?=\p{Lu})/)
    |> Enum.map_join(fn(word) ->
      String.first(word)
      |> String.upcase
    end)
  end
end
