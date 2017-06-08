defmodule Kata do

  def start(string) do
    [head|tail] = String.codepoints(string)
    compress(head, tail, 0, "")
  end

  def compress(letter, [], counter, list), do: list <> to_string(counter + 1) <> letter
  def compress(head, [head|tail], counter, list), do: compress(head, tail, counter + 1, list)
  def compress(letter, [head|tail], counter, list) do
    compress(head, tail, 0, list <> to_string(counter + 1) <> letter)
  end

  def decode(string), do: IO.puts decode(String.codepoints(string), "")
  def decode([], list), do: list
  def decode([number, letter | tail], list) do
    decode(tail, append(String.to_integer(number), letter, list))
  end

  def append(0, _, list), do: list
  def append(number, letter, list), do: append(number - 1, letter, list <> letter)

end
