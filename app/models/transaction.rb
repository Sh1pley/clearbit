class Transaction
  attr_reader :amount,
                    :account_id,
                    :category,
                    :date,
                    :pending,
                    :transaction_type

  def initialize(data)
    @amount = data.amount
    @account_id = data.account_id
    @category = data.category
    @date = data.date
    @pending = data.pending
    @transaction_type = data.transaction_type
  end
end