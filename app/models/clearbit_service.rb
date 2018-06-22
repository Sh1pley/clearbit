require 'clearbit'
require 'dotenv'
Dotenv.load

class ClearbitService

  def initialize
    Clearbit.key = ENV['CLEARBIT_KEY']
  end
  
  def get_domain(name)
    Clearbit::NameDomain.find(name: name)
  end

end