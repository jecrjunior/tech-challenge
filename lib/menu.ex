defmodule Menu do
    def show_menu do
        IO.puts("*********Menu*********")
        IO.puts("1 - Transfer")
        IO.puts("2 - Exchange")
        IO.puts("3 - Out")
        IO.puts("**********************")
        {option} = prompt_option()
        case option do
          "1" -> show_menu_transfer()
          "2" -> show_menu_exchange()
          "3" -> raise "You are out!"
        end
    end

    def show_menu_transfer do
        IO.puts("*********Menu transfer*********")
        IO.puts("What's the money amount?")
        {money} = prompt_word("money")
        IO.puts("What's the account that you want to debit? (Login required)")
        {user_from, money_user_from} = User.login
        IO.puts("What's the account that you want to credit?")
        {user_to} = prompt_word("Enter the account that you want to transfer to")
        {user_to, _, money_user_to} = User.check_account(user_to)
        {money, {user_from, money_user_from}, {user_to, money_user_to}}
    end

    def show_menu_exchange do
        IO.puts("What currency do you want to exchange?")
        {currency} = prompt_word("currency")
        IO.puts("From account:")
        {user_from, money} = User.login
        {currency, {user_from, money}}
    end        

    def prompt_option() do
        without_crlf = fn str -> String.slice(str, 0..-2) end
        {without_crlf.(IO.gets("What is your option?"))}     
    end

    def prompt_word(word) do
        {String.slice(IO.gets("#{word}: "), 0..-2)}
    end   
end

