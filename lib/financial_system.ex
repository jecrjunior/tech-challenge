defmodule FinancialSystem do
  @moduledoc """
  Documentation for FinancialSystem.
  """
  use Application
  @doc """
  Entry point of application
  ## Parameters
  """  
  def start(_type, _args) do
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @doc """
  Main function
  ## Parameters
  """    
  def main() do
    {option} = Menu.show_menu()
    case option do
      "TRANSFER" -> (
        {money, {user_from, money_user_from}, {user_to, _}} = Menu.show_menu_transfer()
        if Money.greater_or_equal_than(money_user_from, money) do
          transfer(user_from, user_to, money)
        else
          raise "User #{user_from} does not have enough money."          
        end
      )
      "EXCHANGE" -> (
        {:ok}#{currency, {user_from, money}} = Menu.show_menu_exchange()
      )
      "OUT" -> raise "You are out!"
      "INVALID" -> raise "Invalid option. Aborting!"
    end
  end

  @doc """
  Debit certain amount of money from an account
  ## Parameters
  """  
  def debit_account(account, current_amount, amount) do
    {value} = Money.sub(current_amount, amount)
    User.set_money_amount(account, value)
  end

  @doc """
  Credit certain amount of money into an account
  ## Parameters
  """      
  def credit_account(account, current_amount, amount) do
    {value} = Money.add(current_amount, amount)
    User.set_money_amount(account, value)
  end

  @doc """
  Transfer certain amount of money from an account to another
  ## Parameters
  """  
  def transfer(from, to, amount) do    
    {_, _, current_amount} = User.check_account(from)
    debit_account(from, current_amount, amount)
    {_, _, current_amount} = User.check_account(to)
    credit_account(to, current_amount, amount)
  end

  @doc """
  Exchanges some amount of money from a currency to another
  ## Parameters
  """   
  def exchange_money() do
    ""
  end
end
