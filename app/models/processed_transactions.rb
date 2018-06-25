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
    return true
  end

  def fetch_domain
    cb = ClearbitService.new
    domain = cb.get_domain(name.split(" ")[0..1]) ||
    cb.get_domain(name.split(" ")[0])
  end

  # self method to initialize processing of Plaid response into prettier format
  def self.process(resp_obj)
    # Array collector for return
    processed_list = []
    # 1 take resp, and separate by name
    names_hash = get_names_hash(resp_obj)
    # 2 for each name add transaction
    resp_obj[:transactions].each do |i|
      names_hash[i.name] << Transaction.new(i)
    end
    # 3 for each separated :name :transaction_list send to processedTransactions
    names_hash.each { |k, v| processed_list << new(k, v)}
    return processed_list
  end

  private
  def self.get_names_hash(obj)
    list = obj[:transactions].map { |i| i.name}.uniq
    hash = {}
    list.each { |name| hash[name] = [] }
    return hash
  end

end