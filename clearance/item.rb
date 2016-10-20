class Item
  attr_reader :name, :price, :discount

  def initialize(name, params)
    @name = name
    @price = params[:price]
    @discount = params[:discount]
  end
end
