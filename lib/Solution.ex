defmodule Kata do

  def start(string) do
    [head|tail] = String.codepoints(string)
    compress_string(head, tail, 0, "")
  end

  def compress_string(head, [head|tail], counter, list) do
    compress_string(head, tail, counter + 1, list)
  end

  def compress_string(letter, [head|tail], counter, list) do
    compress_string(head, tail, 0, list <> to_string(counter + 1) <> letter)
  end

  def compress_string(letter, [], counter, list) do
    list <> to_string(counter + 1) <> letter
  end

end
