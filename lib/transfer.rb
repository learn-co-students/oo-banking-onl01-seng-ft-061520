# frozen_string_literal: false

# a transfer class closely linked to the bank account class
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid? && @status == 'pending' && @sender.balance > @amount ? true : false
  end

  def execute_transaction
    if valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    else
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    return unless @status == 'complete'

    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = 'reversed'
  end
end
