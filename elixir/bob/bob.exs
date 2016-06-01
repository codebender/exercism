defmodule Bob do
  def hey(input) do
    respond_with(input)
  end

  defp respond_with(input) do
    cond do
      is_silent?(input) -> "Fine. Be that way!"
      is_question?(input) -> "Sure."
      is_yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_silent?(input) do
    String.strip(input) == ""
  end

  defp is_question?(input) do
    String.ends_with?(input, "?")
  end

  defp is_yelling?(input) do
    String.upcase(input) == input && String.match?(input, ~r/\p{L}/)
  end
end
