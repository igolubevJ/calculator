defmodule Calculator do
  @spec add(number(), number()) :: number() | nil
  def add(num_a, num_b), do: calculate({:add, num_a, num_b})

  @spec sub(number(), number()) :: number() | nil
  def sub(num_a, num_b), do: calculate({:sub, num_a, num_b})

  @spec mul(number(), number()) :: number() | nil
  def mul(num_a, num_b), do: calculate({:mul, num_a, num_b})

  @spec div(number(), number()) :: float() | nil
  def div(num_a, num_b), do: calculate({:div, num_a, num_b})

  defp calculate({:add, num_a, num_b}) when is_number(num_a) and is_number(num_b) do
    num_a + num_b
  end

  defp calculate({:sub, num_a, num_b}) when is_number(num_a) and is_number(num_b) do
    num_a - num_b
  end

  defp calculate({:mul, num_a, num_b}) when is_number(num_a) and is_number(num_b) do
    num_a * num_b
  end

  defp calculate({:div, num_a, num_b}) when is_number(num_a) and is_number(num_b) do
    num_a / num_b
  end

  defp calculate(_), do: nil
end
