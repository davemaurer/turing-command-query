class Wallet < Array
  def money
    {
      pennies:  self.count(:penny),
      dimes:    self.count(:dime) * 10,
      nickels:  self.count(:nickel) * 5,
      quarters: self.count(:quarter) * 25,
      dollars:  self.count(:dollar) * 100,
    }
  end
  def cents
    money.values.reduce(:+)
  end
end
