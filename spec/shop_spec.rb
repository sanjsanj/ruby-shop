require 'models/shop'

describe Shop do
  # context 'When initialized' do
  it 'has products' do
    expect(subject.products).not_to be_empty
  end

  it 'has a cart' do
    expect(subject.cart).not_to be_nil
  end

  it 'can add a product to the cart' do
    subject.add_to_cart_by_id(1)
    expect(subject.cart.products).to include(item_1)
  end
  # end
end
