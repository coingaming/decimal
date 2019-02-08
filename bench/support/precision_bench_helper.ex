defmodule Decimal.PrecisionBench.Helper do
  alias Decimal, as: D
  alias D.Context

  def new(source, precision) do
    %Context{precision: precision}
    |> D.with_context(fn ->
      source
      |> D.new()
    end)
  end

  def add(x, y, precision) do
    %Context{precision: precision}
    |> D.with_context(fn ->
      D.add(x, y)
    end)
  end

  def sub(x, y, precision) do
    %Context{precision: precision}
    |> D.with_context(fn ->
      D.sub(x, y)
    end)
  end

  def mult(x, y, precision) do
    %Context{precision: precision}
    |> D.with_context(fn ->
      D.mult(x, y)
    end)
  end

  def div(x, y, precision) do
    %Context{precision: precision}
    |> D.with_context(fn ->
      D.div(x, y)
    end)
  end
end
