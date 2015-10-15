class Products
  def self.data
    file = File.read('products.json')
    JSON.parse(file)
  end
end
