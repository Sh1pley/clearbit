require_relative "../services/clearbit_service"
require_relative "transaction"

class ProcessedTransactions

  attr_reader :name,
                    :domain,
                    :transactions,
                    :recurring

  def initialize(key, value)
    create(key, value)
  end

  def create(name, transactions)
    @name = name
    @domain = fetch_domain
    @transactions = transactions
    @recurring = check_recurring
  end
  
  def check_recurring
    recurring = false
    # fast fail if < 2
    if transactions.count < 2
      return recurring
    else
    # parse all transactions
      transactions.each_with_index do |t, i|
        # check compare amounts
        if transactions[i + 1] && t[:amount] == transactions[i + 1][:amount]
          recurring = true
          # if monthly and amount match return true if necessary?
        end
      end
    end
    return recurring
  end

  def fetch_domain
    cb = ClearbitService.new
    domain = cb.get_domain(name.split(" ")[0..1]) ||
    cb.get_domain(name.split(" ")[0])
  end

  # self method to initialize processing of Plaid response into prettier format
  def self.process(resp_obj, pretty = false)
    # Array collector for return
    processed_list = []
    # 1 take resp, and separate by name
    names_hash = get_names_hash(resp_obj)
    # 2 for each name add transaction
    resp_obj[:transactions].each do |i|
      names_hash[i.name] << Transaction.new(i).pretty
    end
    # 3 for each separated :name :transaction_list send to processedTransactions
    if pretty
      names_hash.each { |k, v| processed_list << new(k, v).pretty}
    else
      names_hash.each { |k, v| processed_list << new(k, v)}
    end

   return processed_list
  end

  def pretty
    response = {name: name, domain: domain, transactions: transactions, recurring: recurring}
    return response.to_json
  end

  private
  def self.get_names_hash(obj)
    list = obj[:transactions].map { |i| i.name}.uniq
    hash = {}
    list.each { |name| hash[name] = [] }
    return hash
  end


end