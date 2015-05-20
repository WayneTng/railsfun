require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'validates the presence of title' do
    product = Product.new(title: 'sfsd')
    product.validate
    expect(product.errors.messages).to include(title:["Can't be blank"])
  end

  [:title, :description].each do |field|
    it 'validates the presense of #{field}' do
      product = Product.new
      product.validate
      expect(product.errors.messages).to include(field => ["can't be blank"])
    end
  end
end
