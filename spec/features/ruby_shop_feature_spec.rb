feature 'Feature - The Ruby-Shop homepage' do
  products = Products.data
  item_1 = products.first
  item_2 = products.last

  before do
    visit '/'
  end

  after do
    Capybara.reset!
  end

  # As a User I can add a product to my shopping cart.
  scenario 'allows a product to be added to the cart' do
    cart_total = item_1['price']
    all('.itemContainer')[0].click_on 'Buy'
    expect(page).to have_css('.cartTotal', text:  sprintf('%.2f', cart_total))
  end

  scenario 'allows multiples of a product to be added to the cart' do
    cart_total = item_1['price'] * 2
    all('.itemContainer')[0].click_on 'Buy'
    #visit '/'
    #all('.itemContainer')[0].click_on 'Buy'
    expect(page).to have_css('.cartTotal', text:  sprintf('%.2f', cart_total))
  end

  scenario 'allows multiples of multiple products to be added to the cart' do
    cart_total =(item_1['price'] * 2) + (item_2['price'] * 2)
    all('.itemContainer')[-1].click_on 'Buy'
    visit '/'
    all('.itemContainer')[-1].click_on 'Buy'
    expect(page).to have_css('.cartTotal', text:  sprintf('%.2f', cart_total))
  end

  # As a User I am unable to add Out of Stock products to the shopping cart.
  scenario 'does not allow out of stock products to be added to the cart' do
  end
end

feature 'Feature - The Ruby-Shop shopping cart' do
  before do
    visit '/'
    # add_product
    # click_on '.cart'
  end

  # As a User I can remove a product from my shopping cart.
  scenario 'allows products to be removed from the cart' do
  end

  # As a User I can view the total price for the products in my shopping cart.
  scenario 'shows the total price of products in the cart' do
  end

  # As a User I can apply a voucher to my shopping cart.
  scenario 'allows the entry of voucher codes' do
  end

  # As a User I can view the total price for the products in my shopping cart with discounts applied.
  scenario 'shows total price of products in the cart with discounts' do
  end

  # As a User I am alerted when I apply an invalid voucher to my shopping cart.
  scenario 'raises an alert when an invalid voucher code is entered' do
  end
end
