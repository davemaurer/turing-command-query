require_relative 'item'

class Clearance < Array
  def best_deal
    return nil if self.empty?
    deals = self.sort_by { |el| el.price / el.discount }
    deals.first.name
  end
end
