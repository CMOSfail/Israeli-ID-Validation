defmodule IsraeliIdValidation do
  def valid?(id) do
    id = id |> String.pad_leading("0", 9)
    id_arr = id |> String.split("") |> Enum.map(&String.to_integer/1)
    check_arr = [1, 2, 1, 2, 1, 2, 1, 2]
    calc_arr = Enum.zip(id_arr, check_arr) |> Enum.map(fn {i, c} -> i * c end)
    sum = Enum.reduce(calc_arr, 0, fn x, acc -> acc + (x > 9 ? x - 9 : x) end)
    check_digit = (10 - (sum % 10)) % 10
    id_arr |> List.last() == check_digit
  end
end
