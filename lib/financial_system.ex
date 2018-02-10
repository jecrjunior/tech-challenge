defmodule FinancialSystem do
  @moduledoc """
  Documentation for FinancialSystem.
  """
  def main() do
    {option} = Menu.show_menu()
    case option do
      "TRANSFER" -> (
        {money, {user_from, money_user_from}, {user_to, money_user_to}} = Menu.show_menu_transfer()
        money_user_from = Float.parse(money_user_from)
        money_user_to = Float.parse(money_user_to)
        money = Float.parse(money)
        if money > money_user_from do
          raise "User #{user_from} does not have enough money"
        else
          transfer({user_from, money_user_from}, {user_to, money_user_to}, money)
        end
      )
      "EXCHANGE" -> (
        {currency, {user_from, money}} = Menu.show_menu_exchange()
      )
      "OUT" -> raise "You are out!"
    end
  end

  def debit_account(account, current_amount, amount) do
    {value} = Money.sub(current_amount, amount)
    User.set_money_amount(account, value)
  end
    
  def credit_account(account, current_amount, amount) do
    {value} = Money.add(current_amount, amount)
    User.set_money_amount(account, value)
  end

  def transfer(from, to, amount) do
    {_, _, current_amount} = User.check_account(from)
    debit_account(from, current_amount, amount)
    {_, _, current_amount} = User.check_account(to)
    credit_account(to, current_amount, amount)
  end

  def exchange_money(from, to) do
    ""
  end
end

FinancialSystem.transfer("pedro", "joao", 12.238217381238712873812738127)