require 'models/shop'

describe Shop do
  it 'has products' do
    expect(subject.products).not_to be_empty
  end

  it 'has a cart' do
    expect(subject.cart).not_to be_nil
  end

  it 'can add a product to the cart' do
    item_id = 1
    subject.add_to_cart(id: item_id)
    expect(subject.cart_products.first['id']).to eq item_id
  end

  it 'can add multiples of a product to the cart' do
    item_id = 1
    subject.add_to_cart(id: item_id)
    subject.add_to_cart(id: item_id)
    expect(subject.cart_products.first['cart_quantity']).to eq 2
  end
end
