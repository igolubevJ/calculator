defmodule Calculator do
  @spec add(number(), number()) :: number() | nil
  def add(num_a, num_b) when is_number(num_a) and is_number((num_b)) do
    num_a + num_b
  end

  def add(_, _), do: nil
end
