require "pry"
class Transfer

attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
  
  def valid?
     #if sender.balance > 0 && sender.status == "open" && receiver.balance > 0 && receiver.status == "open"
     if sender.valid? && receiver.valid?
       true
     else 
       false
     end 
  end 

  def execute_transaction 
     #binding.pry
    
     if self.status == "pending" && sender.balance > amount && valid?
      receiver.deposit(amount)
      sender.balance -= amount
      self.status = "complete"
     else 
     self.status = "rejected"
     "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    
    if self.status == "complete"
    sender.deposit(amount)
    receiver.balance -= amount
    self.status = "reversed"
  end 
  end 

  # def sender_valid?(sender)
  #   if sender.balance > 0 && status == "open"
  #     true 
  #   else 
  #     false 
  #   end 
  # end 
  
  # def receiver_valid?(receiver)
  #   if receiver.balance > 0 && status == "open"
  #     true
  #   else 
  #     false 
  #   end 
  # end 
end
