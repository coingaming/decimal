defmodule Decimal.ComparableTest do
  use ExUnit.Case, async: true

  defstruct [:a]

  setup do
    %{
      x0: Decimal.new("1.000"),
      x: Decimal.new("1.0"),
      y: Decimal.new("1.1")
    }
  end

  test "trivial Comp.equal?/2", %{x0: x0, x: x, y: y} do
    refute x0 == x
    assert Comp.equal?(x0, x)
    refute Comp.equal?(x, y)
  end

  test "list Comp.equal?/2", %{x0: x0, x: x, y: y} do
    refute [x0] == [x]
    assert Comp.equal?([x0], [x])
    refute Comp.equal?([x], [y])
  end

  test "tuple Comp.equal?/2", %{x0: x0, x: x, y: y} do
    refute {x0} == {x}
    assert Comp.equal?({x0}, {x})
    refute Comp.equal?({x}, {y})
  end

  test "map Comp.equal?/2", %{x0: x0, x: x, y: y} do
    refute %{a: x0} == %{a: x}
    assert Comp.equal?(%{a: x0}, %{a: x})
    refute Comp.equal?(%{a: x}, %{a: y})
  end

  test "struct Comp.equal?/2", %{x0: x0, x: x, y: y} do
    refute %__MODULE__{a: x0} == %__MODULE__{a: x}
    assert Comp.equal?(%__MODULE__{a: x0}, %__MODULE__{a: x})
    refute Comp.equal?(%__MODULE__{a: x}, %__MODULE__{a: y})
  end

  test "nested Comp.equal?/2", %{x0: x0, x: x, y: y} do
    refute %__MODULE__{a: [%{a: x0}]} == %__MODULE__{a: [%{a: x}]}
    assert Comp.equal?(%__MODULE__{a: [%{a: x0}]}, %__MODULE__{a: [%{a: x}]})
    refute Comp.equal?(%__MODULE__{a: [%{a: x}]}, %__MODULE__{a: [%{a: y}]})
  end

  test "fallback", %{x: x} do
    refute Comp.equal?(x, :hello)
  end
end
