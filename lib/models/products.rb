class Products
  def self.data(data: 'products.json')
    file = File.read(data)
    JSON.parse(file)
  end

  def self.decrement_shop_quantity(item)
  end
end
