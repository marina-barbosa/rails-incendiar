require "rails_helper"

RSpec.describe Product, type: :model do
  describe "#valid?" do
    it "falso quando o nome está vazio" do
      # Arrange
      product = Product.new(
        name: "",
        description: "Isqueiro à prova de vento com garantia vitalícia. Modelo clássico da Zippo.",
        price: 150.00,
        stock: 30,
      )
      # Act
      result = product.valid?
      # Assert
      expect(result).to eq false
    end
    it "falso quando o preço está vazio" do
      # Arrange
      product = Product.new(
        name: "Isqueiro Clássico Zippo",
        description: "Isqueiro à prova de vento com garantia vitalícia. Modelo clássico da Zippo.",
        price: "",
        stock: 30,
      )
      # Act
      result = product.valid?
      # Assert
      expect(result).to eq false
    end
    it "falso quando o estoque está vazio" do
      # Arrange
      product = Product.new(
        name: "Isqueiro Clássico Zippo",
        description: "Isqueiro à prova de vento com garantia vitalícia. Modelo clássico da Zippo.",
        price: 150.00,
        stock: "",
      )
      # Act
      result = product.valid?
      # Assert
      expect(result).to eq false
    end
  end
end
