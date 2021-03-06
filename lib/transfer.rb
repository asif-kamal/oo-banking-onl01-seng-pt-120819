require 'pry'

class Transfer

attr_reader :status
attr_accessor :sender, :receiver, :amount

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount 
  @status = "pending"
end

def valid?
  if @sender.valid? && @receiver.valid?
      true 
  else
    false 
  end
end

def execute_transaction

  if @receiver.valid? === false || @sender.valid? === false || @status != "pending" || @sender.balance < amount
     @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  else
  @sender.balance -= amount
  @receiver.balance += amount
  @status = "complete"
  end
end


def reverse_transfer
  if @status == "complete"
  @sender.balance += amount
  @receiver.balance -= amount
  @status = "reversed"
end
end

end
