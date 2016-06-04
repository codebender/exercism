defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    downcased_base = String.downcase(base)
    down_alpha_source = alphabetize(downcased_base)
    Enum.filter(candidates, fn x -> anagram?(base, down_alpha_source, x) end)
  end

  defp alphabetize(string) do
    String.to_char_list(string)
    |> Enum.sort
  end

  defp anagram?(downcased_base, down_alpha_source, candidate) do
    downcased_candidate = String.downcase(candidate)
    cond do
      downcased_base == downcased_candidate -> false
      down_alpha_source == alphabetize(downcased_candidate) -> true
      true -> false
    end
  end
end
