defmodule Money do
  @moduledoc """
  Documentation for Money.

  """  
  alias Decimal, as: D
    @doc """
    Adds precisely two values
    ## Parameters
    """
    def add(value1, value2) do
        sum = D.add(D.new(value1), D.new(value2))
        {D.to_string(sum)}
    end

    @doc """
    Subtracts precisely two values
    ## Parameters
    """
    def sub(value1, value2) do
        sub = D.sub(D.new(value1), D.new(value2))
        {D.to_string(sub)}
    end

    @doc """
    Multiplies precisely the first value for the second
    ## Parameters
    """    
    def mul(value1, value2) do
        mul = D.mult(D.new(value1), D.new(value2))
        {D.to_string(mul)}
    end

    @doc """
    Devides precisely the first value for the second
    ## Parameters
    """
    def div(value1, value2) do
        div = D.div(D.new(value1), D.new(value2))
        {D.to_string(div)}
    end

    @doc """
    Compares if the first value is greater or equal than the second
    ## Parameters
    """
    def lower_or_equal_than(value1, value2) do
        compare = D.compare(D.new(value1), D.new(value2))
        {!D.equal?(compare, D.new(1))}  
    end

    @doc """
    Compares if the first value is lower or equal than the second
    ## Parameters
    """
    def greater_or_equal_than(value1, value2) do
        compare = D.compare(D.new(value1), D.new(value2))
        {!D.equal?(compare, D.new(-1))}  
    end
end