describe Cart do
  let(:cart) { Cart.new }
  
  it 'initializes with empty products array' do
    expect(cart.products).to eq []
  end
  
  it 'can add an item to it' do
    item = {"id" => 0, "cart_quantity" => 0}
    cart.add_item(item: item)
    expect(cart.products).to eq [item]
  end

  it 'knows the total price of products in it' do
    item = { 'id' => 0, 'cart_quantity' => 0, 'price' => 99.00 }
    cart.add_item(item: item)
    expect(cart.total).to eq item['price']
  end
end
