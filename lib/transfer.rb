require 'pry'

class Transfer
  #your code here
  attr_accessor :sender, :receiver, :amount, :status
  @@all = []
  def initialize(sender, receiver, transfer_amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    @@all = self
  end
  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount && self.status == "pending"
  end
  def execute_transaction
    #binding.pry
    if @status == "pending" && valid?
      @sender.deposit((-1)*@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete" && @status != "reversed"
      @sender.deposit(@amount)
      @receiver.deposit((-1)*@amount)
      @status = "reversed"
    end
  end
end
# no real change. Just for resubmit
