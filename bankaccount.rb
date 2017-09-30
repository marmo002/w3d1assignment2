class Bankaccount
  @@interest_rate = 0.09 #9%
  @@accounts = []

  def self.create
    account = Bankaccount.new
    @@accounts << account
    account
  end

  def self.all_accounts
    @@accounts
  end

  def self.total_funds
    a = @@accounts.map { |e| e.balance  }
    a.sum
  end

  def self.interest_time
    @@accounts.each do |account|
      amount = account.balance * @@interest_rate
      account.deposit = amount
    end
  end

      def initialize
        @balance = 0
      end

          def balance
            @balance
          end

          def new_balance=(new_balance)
            @balance = new_balance
          end

          def deposit=(amount)
            @balance += amount
          end

          def withdrawn=(amount)
            @balance -= amount
          end

end

first = Bankaccount.create
puts first.inspect
second = Bankaccount.create
puts second.inspect

first.new_balance = 500
second.new_balance = 120

p Bankaccount.all_accounts

Bankaccount.interest_time

p Bankaccount.all_accounts

puts  "Balance on first account #{first.balance}"
puts  "Balance on second account #{second.balance}"
