class BankAccount
    attr_accessor  :status, :balance
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @status = "open"
        @balance = 1000
    end

    def self.all
        @@all
    end

    def deposit(deposit_amt)
        self.balance += deposit_amt
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if (balance>0) && (status == "open")
            true
        else
            false
        end
    end

    def close_account
        self.status = "closed"
    end


end
