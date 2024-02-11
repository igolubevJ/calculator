defmodule Calculator do
  @moduledoc """
  The module contains basic mathematical operations on numbers:

  - addition
  - subtraction
  - multiplication
  - separation

  Each function returns the results of calculations that allow we need
  to make comp chains.

  #### Examples

      iex> Calculator.add(42, 4) |> Calculator.div(2)
      23.0

  If the function does not support the given arguments, the function
  will return nil

  #### Examlpes

      iex> Calculator.add("42", 4)
      nil

  The module has a division function that always returns `float`
  and when divided by 0 will return `nil`

  #### Examples

      iex> Calculator.div(42, 2)
      21.0

      iex> Calculator.div(42, 0)
      nil

      iex> Calculator.div(42, 0.0)
      nil
  """
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

  defp calculate({:div, _, 0}), do: nil
  defp calculate({:div, _, 0.0}), do: nil
  defp calculate({:div, num_a, num_b}) when is_number(num_a) and is_number(num_b) do
    num_a / num_b
  end

  defp calculate(_), do: nil
end
