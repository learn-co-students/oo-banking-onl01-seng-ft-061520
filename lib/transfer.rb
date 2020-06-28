require "pry"

class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction 
    if sender.balance < amount
      return "Transaction rejected. Please check your account balance."    
    elsif valid? && status == "pending"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      self.status = "complete"
    end

  end




end
