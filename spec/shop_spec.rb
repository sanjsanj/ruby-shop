require 'models/shop'

describe Shop do
  context 'When initialized' do
    it 'has products' do
      expect(subject.products).not_to be_empty
    end

    it 'has a cart' do
      expect(subject.cart).not_to be_nil
    end
  end
end
