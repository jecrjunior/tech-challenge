defmodule User do
    @moduledoc """
    Documentation for User.

    """
    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def user_data_filename do           
        "./data/users.dat"
    end


    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def login do
        without_crlf = fn str -> String.slice(str, 0..-2) end
        user = without_crlf.(IO.gets("Whats is your login name?"))
        password = without_crlf.(IO.gets("Whats is your password?"))
        {_, _, money_amount} = check_account(user, password)
        {user, money_amount}
    end

    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def check_account(user) do
        file_name = user_data_filename()
        {:ok, file_content} = File.read(file_name)
        lines = String.split(file_content, "\r\n")
        #Without empty lines
        lines = Enum.filter(lines, fn(x) -> x != "" end)
        look_for_in(user, lines)
    end

    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def check_account(user, password) do
        {p_user, p_password, p_money_amount} = check_account(user)
        unless p_user == user && p_password == password do
            raise "Incorrect password"
        else
            {user, password, p_money_amount}
        end    
    end    

    @doc """
    Name
    ## Parameters
    ## Examples
    """    
    def look_for_in(user, lines) do
        case lines do
            [] -> raise "User not found"
            [head | tail] -> (
                user_tuple = List.to_tuple(String.split(head, " "))
                {p_user, p_password, p_money_amount} = user_tuple
                if user == p_user do
                    {p_user, p_password, p_money_amount}
                else
                    look_for_in(user, tail)
                end
            )
        end
    end

    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def create_account(user, password) do
        try do
            {user, _, _} = check_account(user)
            raise "User #{user} already exists"
        rescue
            e in RuntimeError ->
                unless e.message == "User not found" do
                    raise e.message
                else
                    {:ok, file} = File.open(user_data_filename(), [:append])
                    IO.write(file, "#{user} #{password} 0\r\n")
                    File.close(file)
                end
        end
    end

    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def set_money_amount(user, money_amount) do
        {p_user, p_password, p_money_amount} = check_account(user)
        account = {p_user, p_password, p_money_amount}
        file_name = user_data_filename()
        {:ok, file_content} = File.read(file_name)
        file_content = String.replace(file_content, "#{p_user} #{p_password} #{p_money_amount}", "#{user} #{p_password} #{money_amount}", global: false)
        File.write(file_name, file_content)
        {user, money_amount}
    end
    
    @doc """
    Name
    ## Parameters
    ## Examples
    """
    def get_money_amount(user) do        
        {_, _, money_amount} = check_account(user)
        money_amount
    end   
end
