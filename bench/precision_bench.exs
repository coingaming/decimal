defmodule Decimal.PrecisionBench do
  use Benchfella
  alias Decimal, as: D
  alias Decimal.PrecisionBench.Helper

  @x "987654321.987654321"
  @y "123456789.123456789"

  @x1 Helper.new(@x, 1)
  @x5 Helper.new(@x, 5)
  @x8 Helper.new(@x, 8)
  @x10 Helper.new(@x, 10)
  @x50 Helper.new(@x, 50)
  @x_default D.new(@x)

  @y1 Helper.new(@y, 1)
  @y5 Helper.new(@y, 5)
  @y8 Helper.new(@y, 8)
  @y10 Helper.new(@y, 10)
  @y50 Helper.new(@y, 50)
  @y_default D.new(@y)

  bench "new 1" do
    Helper.new(@x, 1)
  end

  bench "new 5" do
    Helper.new(@x, 5)
  end

  bench "new 8" do
    Helper.new(@x, 8)
  end

  bench "new 10" do
    Helper.new(@x, 10)
  end

  bench "new 50" do
    Helper.new(@x, 50)
  end

  bench "new default" do
    D.new(@x)
  end

  bench "+ 1" do
    Helper.add(@x1, @y1, 1)
  end

  bench "- 1" do
    Helper.sub(@x1, @y1, 1)
  end

  bench "* 1" do
    Helper.mult(@x1, @y1, 1)
  end

  bench "/ 1" do
    Helper.div(@x1, @y1, 1)
  end

  bench "+ 5" do
    Helper.add(@x5, @y5, 5)
  end

  bench "- 5" do
    Helper.sub(@x5, @y5, 5)
  end

  bench "* 5" do
    Helper.mult(@x5, @y5, 5)
  end

  bench "/ 5" do
    Helper.div(@x5, @y5, 5)
  end

  bench "+ 8" do
    Helper.add(@x8, @y8, 8)
  end

  bench "- 8" do
    Helper.sub(@x8, @y8, 8)
  end

  bench "* 8" do
    Helper.mult(@x8, @y8, 8)
  end

  bench "/ 8" do
    Helper.div(@x8, @y8, 8)
  end

  bench "+ 10" do
    Helper.add(@x10, @y10, 10)
  end

  bench "- 10" do
    Helper.sub(@x10, @y10, 10)
  end

  bench "* 10" do
    Helper.mult(@x10, @y10, 10)
  end

  bench "/ 10" do
    Helper.div(@x10, @y10, 10)
  end

  bench "+ 50" do
    Helper.add(@x50, @y50, 50)
  end

  bench "- 50" do
    Helper.sub(@x50, @y50, 50)
  end

  bench "* 50" do
    Helper.mult(@x50, @y50, 50)
  end

  bench "/ 50" do
    Helper.div(@x50, @y50, 50)
  end

  bench "+ default" do
    D.add(@x_default, @y_default)
  end

  bench "- default" do
    D.sub(@x_default, @y_default)
  end

  bench "* default" do
    D.mult(@x_default, @y_default)
  end

  bench "/ default" do
    D.div(@x_default, @y_default)
  end
end
