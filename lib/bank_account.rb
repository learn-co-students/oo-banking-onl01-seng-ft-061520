# frozen_string_literal: false

# a bank account class with a name, balance, and status
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = 'open'
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    @balance.positive? && @status == 'open' ? true : false
  end

  def close_account
    @status = 'closed'
  end
end
