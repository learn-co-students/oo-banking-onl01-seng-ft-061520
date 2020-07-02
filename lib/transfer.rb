class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  attr_writer
  attr_reader
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? && receiver.valid? && sender.balance>amount
      true
    else
      false
    end
  end
  
  def execute_transaction
    if self.valid? && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      return true
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.execute_transaction
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
  
end
