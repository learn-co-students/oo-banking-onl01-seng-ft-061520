class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end

  def valid?
    sender.valid?
    receiver.valid?
  end
  
  def execute_transaction
    if sender.balance < @amount || receiver.status != "open"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      
    elsif @status == "pending" 
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
     
      end
    
  end

  def reverse_transfer
    if @status == "complete"
    receiver.balance -= amount
    sender.balance += amount
    @status = "reversed"


    
    end

  end




end
