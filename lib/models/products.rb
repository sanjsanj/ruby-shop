class Products
  def initialize(data: 'products.json')
    file = File.read(data)
    @instance_data = JSON.parse(file)
  end

  def data
    @instance_data
  end

  def find(id:)
    @instance_data.find { |product| product['id'] == id.to_i }
  end

  def decrement_stock(id:)
    @instance_data[id]['shop_quantity'] -= 1
  end
end
