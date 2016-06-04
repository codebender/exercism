defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      sublist_of?(a, b) -> :sublist
      sublist_of?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist_of?([], _b), do: true
  defp sublist_of?(_a, []), do: false
  defp sublist_of?(first, second) when length(first) > length(second), do: false
  defp sublist_of?(first, second) do
    a = Enum.map_join(first, "|", fn x -> to_string(x) end)
    b = Enum.map_join(second, "|", fn x -> to_string(x) end)
    String.contains?("|" <> b <> "|", "|" <> a <> "|")
  end
end
