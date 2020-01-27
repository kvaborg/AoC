defmodule Day01 do

  def get_fuel() do
    {:ok, body} = File.read("day01.txt")
    body = body |> String.split("\n", trim: true)
    individual_mass = string_to_int(body)
    tot_fuel = calc_fuel(individual_mass, 0)
    tot_fuel
  end

  def calc_fuel([], acc) do acc end
  def calc_fuel([h|t], acc) do
    accum = calc_sub_fuel([Integer.floor_div(h, 3) - 2], acc + (Integer.floor_div(h, 3) - 2))
    calc_fuel(t, accum)
  end

  def calc_sub_fuel([h|_], acc) when h <= 6 do acc end
  def calc_sub_fuel([h|_], acc) do 
    calc_sub_fuel([Integer.floor_div(h, 3) - 2], acc + (Integer.floor_div(h, 3) - 2))
  end


  def string_to_int([]) do [] end
  def string_to_int([h|t]) do
    {head, _} = Integer.parse(h)
    [head | string_to_int(t)]
  end
end 
