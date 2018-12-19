class Transfer
  attr_accessor  :status
  attr_reader :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction 
    
    if self.valid? == true && self.status == "pending"
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      self.status = "complete"
    end
    if self.valid? == false
      "Transaction rejected. Please check your account balance."
  end
  
  def reverse_transfer
    if self.status = "complete"
      self.sender.balance = self.sender.balance + self.amount
      self.receiver.balance = self.receiver.balance - self.amount
    end
  end
end
end