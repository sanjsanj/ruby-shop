class Products
  def self.data(data: 'products.json')
    file = File.read(data)
    JSON.parse(file)
  end

  def self.find(id:)
    data.find { |product| product['id'] == id.to_i }
  end
end
