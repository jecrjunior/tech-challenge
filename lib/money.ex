defmodule Money do
    alias Decimal, as: D
    def add(value1, value2) do
        sum = D.add(D.new(value1), D.new(value2))
        {D.to_float(sum)}
    end

    def sub(value1, value2) do
        sub = D.sub(D.new(value1), D.new(value2))
        {D.to_float(sub)}
    end

    def mul(value1, value2) do
        mul = D.mult(D.new(value1), D.new(value2))
        {D.to_float(mul)}
    end

    def div(value1, value2) do
        div = D.div(D.new(value1), D.new(value2))
        {D.to_float(div)}
    end

    def lower_or_equal_than(value1, value2) do   
        div = D.div(D.new(value1), D.new(value2))
        {D.to_float(div)}  
    end

    def greater_or_equal_than(value1, value2) do
        div = D.div(D.new(value1), D.new(value2))
        {D.to_float(div)}
    end
end

{m} = Money.div(10.23, 8.7383)
 IO.puts m 