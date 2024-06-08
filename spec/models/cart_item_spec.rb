require "rails_helper"

RSpec.describe CartItem, type: :model do
  describe "#valid?" do
    before do
      @user = User.create!(
        email: "isaac@email.com",
        password: "123456",
        name: "Isaac Smith",
        cpf: "12345678900",
        phone: "13900009999",
      )
      @product = Product.create!(
        name: "Isqueiro Clássico Zippo",
        description: "Isqueiro à prova de vento com garantia vitalícia. Modelo clássico da Zippo.",
        price: 150.00,
        stock: 30,
      )
    end

    it "é inválido sem um user_id" do
      # Arrange
      cart_item = CartItem.new(user_id: nil, product_id: @product.id, quantity: 1)
      # Act
      result = cart_item.valid?
      # Assert
      expect(result).to eq false
    end

    it "é inválido sem um product_id" do
      # Arrange
      cart_item = CartItem.new(user_id: @user.id, product_id: nil, quantity: 1)
      # Act
      result = cart_item.valid?
      # Assert
      expect(result).to eq false
    end

    it "é inválido sem uma quantidade" do
      # Arrange
      cart_item = CartItem.new(user_id: @user.id, product_id: @product.id, quantity: nil)
      # Act
      result = cart_item.valid?
      # Assert
      expect(result).to eq false
    end

    it "é inválido com uma quantidade não inteira" do
      # Arrange
      cart_item = CartItem.new(user_id: @user.id, product_id: @product.id, quantity: "dois")
      # Act
      result = cart_item.valid?
      # Assert
      expect(result).to eq false
    end

    it "é inválido com uma quantidade menor ou igual a zero" do
      # Arrange
      cart_item1 = CartItem.new(user_id: @user.id, product_id: @product.id, quantity: 0)
      cart_item2 = CartItem.new(user_id: @user.id, product_id: @product.id, quantity: -1)
      # Act
      result1 = cart_item1.valid?
      result2 = cart_item2.valid?
      # Assert
      expect(result1).to eq false
      expect(result2).to eq false
    end

    it "é válido com todos os campos obrigatórios preenchidos corretamente" do
      # Arrange
      cart_item = CartItem.new(user_id: @user.id, product_id: @product.id, quantity: 2)
      # Act
      result = cart_item.valid?
      # Assert
      expect(result).to eq true
    end
  end
end
