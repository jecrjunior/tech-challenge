defmodule Money do
  @moduledoc """
  Documentation for Money.

  """  
  alias Decimal, as: D
    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def add(value1, value2) do
        sum = D.add(D.new(value1), D.new(value2))
        {D.to_string(sum)}
    end

    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def sub(value1, value2) do
        sub = D.sub(D.new(value1), D.new(value2))
        {D.to_string(sub)}
    end

    @doc """
    Name
    ## Parameters
    ## Examples
    """    
    def mul(value1, value2) do
        mul = D.mult(D.new(value1), D.new(value2))
        {D.to_string(mul)}
    end

    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def div(value1, value2) do
        div = D.div(D.new(value1), D.new(value2))
        {D.to_string(div)}
    end

    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def lower_or_equal_than(value1, value2) do
        compare = D.compare(D.new(value1), D.new(value2))
        {!D.equal?(compare, D.new(1))}  
    end

    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def greater_or_equal_than(value1, value2) do
        compare = D.compare(D.new(value1), D.new(value2))
        {!D.equal?(compare, D.new(-1))}  
    end
end