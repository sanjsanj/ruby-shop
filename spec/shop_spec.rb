require 'models/shop'

describe Shop do
  let(:shop) { Shop.new(products: 'products_mock.json') }
  it 'has products' do
    expect(shop.products).not_to be_empty
  end

  it 'has a cart' do
    expect(shop.cart).not_to be_nil
  end

  context 'knows the total price when you add' do
    it 'a product to the cart' do
      item_id = 1
      shop.add_to_cart(id: item_id)
      expect(shop.cart_total).to eq 99.00
    end

    it 'multiples of a product to the cart' do
      item_id = 1
      shop.add_to_cart(id: item_id)
      shop.add_to_cart(id: item_id)
      expect(shop.cart_total).to eq 198.00
    end

    it 'multiples of multiple products to the cart' do
      item_id, item_id_2 = 1, 2
      shop.add_to_cart(id: item_id)
      shop.add_to_cart(id: item_id)
      shop.add_to_cart(id: item_id_2)
      shop.add_to_cart(id: item_id_2)
      expect(shop.cart_total).to eq 282.00
    end
  end
end
