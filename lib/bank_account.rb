class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @@all = self
        @balance = 1000
        @status = "open"
    end
    def deposit(amount)
        @balance += amount
    end
    def valid?
        #binding.pry
        @status == "open" && @balance > 0
    end
    def close_account
        @status = "closed"
    end
    def display_balance
        "Your balance is $#{@balance}."
    end
end
