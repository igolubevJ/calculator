defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  test "returns the result of addition two numbers" do
    assert Calculator.add(42, 2) == 44
    assert Calculator.add(42.5, 2.5) == 45
    assert Calculator.add(42, 2.5) == 44.5
    assert Calculator.add(42.5, 2) == 44.5
  end

  test "returns nil if we are passing wrong args" do
    assert Calculator.add("42", "2") == nil
    assert Calculator.add(42, "2") == nil
    assert Calculator.add("42", 2) == nil
    assert Calculator.add([42], 2) == nil
    assert Calculator.add(42, [2]) == nil
    assert Calculator.add({42}, 2) == nil
    assert Calculator.add(42, {2}) == nil
    assert Calculator.add(%{x: 42}, 2) == nil
    assert Calculator.add(42, %{x: 2}) == nil
    assert Calculator.add(nil, 2) == nil
    assert Calculator.add(42, nil) == nil
    assert Calculator.add(true, 2) == nil
    assert Calculator.add(42, false) == nil
  end
end
