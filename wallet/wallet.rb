class Wallet < Array
  def money
    {
      pennies: self.count(:penny),
      nickels: self.count(:nickel) * 5,
      quarters: self.count(:quarter),
      dollars: self.count(:dollar),
    }
  end
  def cents
    money.values.reduce(:+)
  end
end
