defmodule Decimal.EqualableTest do
  use ExUnit.Case, async: true

  defstruct [:a]

  setup do
    %{
      x0: Decimal.new("1.0"),
      x: Decimal.new("1"),
      y: Decimal.new("1.1")
    }
  end

  test "trivial Eq.equal?/2", %{x0: x0, x: x, y: y} do
    refute x0 == x
    assert Eq.equal?(x0, x)
    refute Eq.equal?(x, y)
  end

  test "list Eq.equal?/2", %{x0: x0, x: x, y: y} do
    refute [x0] == [x]
    assert Eq.equal?([x0], [x])
    refute Eq.equal?([x], [y])
  end

  test "tuple Eq.equal?/2", %{x0: x0, x: x, y: y} do
    refute {x0} == {x}
    assert Eq.equal?({x0}, {x})
    refute Eq.equal?({x}, {y})
  end

  test "map Eq.equal?/2", %{x0: x0, x: x, y: y} do
    refute %{a: x0} == %{a: x}
    assert Eq.equal?(%{a: x0}, %{a: x})
    refute Eq.equal?(%{a: x}, %{a: y})
  end

  test "struct Eq.equal?/2", %{x0: x0, x: x, y: y} do
    refute %__MODULE__{a: x0} == %__MODULE__{a: x}
    assert Eq.equal?(%__MODULE__{a: x0}, %__MODULE__{a: x})
    refute Eq.equal?(%__MODULE__{a: x}, %__MODULE__{a: y})
  end

  test "nested Eq.equal?/2", %{x0: x0, x: x, y: y} do
    refute %__MODULE__{a: [%{a: x0}]} == %__MODULE__{a: [%{a: x}]}
    assert Eq.equal?(%__MODULE__{a: [%{a: x0}]}, %__MODULE__{a: [%{a: x}]})
    refute Eq.equal?(%__MODULE__{a: [%{a: x}]}, %__MODULE__{a: [%{a: y}]})
  end

  test "fallback", %{x: x} do
    refute Eq.equal?(x, :hello)
  end
end
