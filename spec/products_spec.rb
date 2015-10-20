require 'models/products'

describe Products do
  let(:products) { Products.new }
  let(:product_1) { products.data[0] }

  it 'contains data' do
    expect(products.data).not_to be_nil
  end

  context 'Data has' do
    it 'an id number' do
      expect(product_1['id'].class).to be Fixnum
    end

    it 'a name string' do
      expect(product_1['name'].class).to be String
    end

    it 'a category string' do
      expect(product_1['category'].class).to be String
    end

    it 'an image url string' do
      expect(product_1['image'].class).to be String
    end

    it 'a price float' do
      expect(product_1['price'].class).to be Float
    end

    it 'a shop_quantity number' do
      expect(product_1['shop_quantity'].class).to be Fixnum
    end

    it 'a cart_quantity number' do
      expect(product_1['cart_quantity'].class).to be Fixnum
    end
  end

  it 'can find a product by id' do
    expect(products.find(id: 0)).to eq product_1
  end

  it "can decrement a product's shop_quantity" do
    products.decrement_stock(id: 0)
    expect(products.data[0]['shop_quantity']).to eq 4
  end
end
