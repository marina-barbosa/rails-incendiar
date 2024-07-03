require "rails_helper"

RSpec.describe User, type: :model do
  describe "#valid?" do
    it "true quando o role está vazio" do
      # Arrange
      user = User.new(
        email: "admin@email.com",
        password: "123456",
        name: "Hortencia",
        cpf: "12345678900",
        phone: "13900009999",
      )
      # Act
      result = user.valid?
      # Assert
      expect(result).to eq true
    end
    it "role customer quando o role está vazio" do
      # Arrange
      user = User.new(
        email: "admin@email.com",
        password: "123456",
        name: "Hortencia",
        cpf: "12345678900",
        phone: "13900009999",
      )
      # Act
      result = user.role == "customer"
      # Assert
      expect(result).to eq true
    end
    it "role admin quando o role é setado" do
      # Arrange
      user = User.new(
        email: "admin@email.com",
        password: "123456",
        name: "Hortencia",
        cpf: "12345678900",
        phone: "13900009999",
        role: "admin",
      )
      # Act
      result = user.role == "admin"
      # Assert
      expect(result).to eq true
    end
    it "falso quando o nome está vazio" do
      # Arrange
      user = User.new(
        email: "admin@email.com",
        password: "123456",
        name: "",
        cpf: "12345678900",
        phone: "13900009999",
      )
      # Act
      result = user.valid?
      # Assert
      expect(result).to eq false
    end
    it "falso quando o cpf está vazio" do
      # Arrange
      user = User.new(
        email: "admin@email.com",
        password: "123456",
        name: "Hortencia",
        cpf: "",
        phone: "13900009999",
      )
      # Act
      result = user.valid?
      # Assert
      expect(result).to eq false
    end
    it "falso quando o telefone está vazio" do
      # Arrange
      user = User.new(
        email: "admin@email.com",
        password: "123456",
        name: "Hortencia",
        cpf: "12345678900",
        phone: "",
        role: "customer",
      )
      # Act
      result = user.valid?
      # Assert
      expect(result).to eq false
    end
  end
  describe "#description" do
    it "exibe o nome e email" do
      # Arrange
      user = User.new(name: "Isaac", email: "isaac@email.com")
      # Act
      result = user.description
      # Assert
      expect(result).to eq "Isaac <isaac@email.com>"
    end
  end
end
