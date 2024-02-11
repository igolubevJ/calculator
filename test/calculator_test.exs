defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  defp bad_args() do
    [
      %{num_a: "42", num_b: "2"},
      %{num_a: "42", num_b: 2},
      %{num_a: 42, num_b: "2"},
      %{num_a: [42], num_b: 2},
      %{num_a: 42, num_b: [2]},
      %{num_a: {42}, num_b: 2},
      %{num_a: 42, num_b: {2}},
      %{num_a: %{x: 42}, num_b: 2},
      %{num_a: 42, num_b: %{x: 2}},
      %{num_a: nil, num_b: 2},
      %{num_a: "42", num_b: nil},
      %{num_a: true, num_b: 2},
      %{num_a: 42, num_b: false}
    ]
  end

  defp assert_raise_arithmetic_error(func, num_a, num_b) do
    assert_raise ArithmeticError, fn ->
      func.(num_a, num_b)
    end
  end

  defp assert_raise_argument_error(func, num_a, num_b) do
    assert_raise ArgumentError, fn ->
      func.(num_a, num_b)
    end
  end

  describe "add/2" do
    test "returns the result of addition two numbers" do
      assert Calculator.add(42, 2) == 44
      assert Calculator.add(42.5, 2.5) == 45
      assert Calculator.add(42, 2.5) == 44.5
      assert Calculator.add(42.5, 2) == 44.5

      assert Calculator.add(42, -2) == 40
      assert Calculator.add(-42, 2) == -40
      assert Calculator.add(-42, -2) == -44
    end

    test "returns nil if we are passing wrong args" do
      Enum.map(bad_args(), fn a ->
        assert_raise_argument_error(&Calculator.add/2, a.num_a, a.num_b)
      end)
    end
  end

  describe "sub/2" do
    test "returns the result of subtraction" do
      assert Calculator.sub(42, 2) == 40
      assert Calculator.sub(42.5, 2.5) == 40.0
      assert Calculator.sub(42, 2.5) == 39.5
      assert Calculator.sub(42.5, 2) == 40.5

      assert Calculator.sub(42, -2) == 44
      assert Calculator.sub(-42, 2) == -44
      assert Calculator.sub(-42, -2) == -40
    end

    test "raise argument error if we are passing wrong args" do
      Enum.map(bad_args(), fn a ->
        assert_raise_argument_error(&Calculator.sub/2, a.num_a, a.num_b)
      end)
    end
  end

  describe "mul/2" do
    test "returns the result of multiplication" do
      assert Calculator.mul(42, 2) == 84
      assert Calculator.mul(42.5, 2.5) == 106.25
      assert Calculator.mul(42, 2.5) == 105.0
      assert Calculator.mul(42.5, 2) == 85.0

      assert Calculator.mul(42, -2) == -84
      assert Calculator.mul(-42, 2) == -84
      assert Calculator.mul(-42, -2) == 84
    end

    test "raise argument error if we are passing wrong args" do
      Enum.map(bad_args(), fn a ->
        assert_raise_argument_error(&Calculator.mul/2, a.num_a, a.num_b)
      end)
    end
  end

  describe "div/2" do
    test "returns the result of division" do
      assert Calculator.div(42, 2) == 21.0
      assert Calculator.div(42.5, 2.5) == 17.0
      assert Calculator.div(42, 2.5) == 16.8
      assert Calculator.div(42.5, 2) == 21.25

      assert Calculator.div(42, -2) == -21
      assert Calculator.div(-42, 2) == -21
      assert Calculator.div(-42, -2) == 21
    end

    test "raise arithmetic error if divisor is 0" do
      assert_raise_arithmetic_error(&Calculator.div/2, 42, 0)
      assert_raise_arithmetic_error(&Calculator.div/2, 42.0, 0)
      assert_raise_arithmetic_error(&Calculator.div/2, 42, 0.0)
      assert_raise_arithmetic_error(&Calculator.div/2, 42.0, 0.0)
    end

    test "raise argument error if we are passing wrong args" do
      Enum.map(bad_args(), fn a ->
        assert_raise_argument_error(&Calculator.div/2, a.num_a, a.num_b)
      end)
    end
  end
end
