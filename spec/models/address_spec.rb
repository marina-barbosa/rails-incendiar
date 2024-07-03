require "rails_helper"

RSpec.describe Address, type: :model do
  describe "#valid?" do
    it "falso quando a rua está vazia" do
      # Arrange
      address = Address.new(
        street: "",
        number: "123",
        neighborhood: "Centro",
        city: "São Paulo",
        state: "SP",
        postal_code: "12345-678",
        country: "Brasil",
        complement: "Apto 101",
        user: User.new,
      )
      # Act
      result = address.valid?
      # Assert
      expect(result).to eq false
    end

    it "falso quando o número está vazio" do
      # Arrange
      address = Address.new(
        street: "Avenida Paulista",
        number: "",
        neighborhood: "Centro",
        city: "São Paulo",
        state: "SP",
        postal_code: "12345-678",
        country: "Brasil",
        complement: "Apto 101",
        user: User.new,
      )
      # Act
      result = address.valid?
      # Assert
      expect(result).to eq false
    end

    it "falso quando o bairro está vazio" do
      # Arrange
      address = Address.new(
        street: "Avenida Paulista",
        number: "123",
        neighborhood: "",
        city: "São Paulo",
        state: "SP",
        postal_code: "12345-678",
        country: "Brasil",
        complement: "Apto 101",
        user: User.new,
      )
      # Act
      result = address.valid?
      # Assert
      expect(result).to eq false
    end

    it "falso quando a cidade está vazia" do
      # Arrange
      address = Address.new(
        street: "Avenida Paulista",
        number: "123",
        neighborhood: "Centro",
        city: "",
        state: "SP",
        postal_code: "12345-678",
        country: "Brasil",
        complement: "Apto 101",
        user: User.new,
      )
      # Act
      result = address.valid?
      # Assert
      expect(result).to eq false
    end

    it "falso quando o estado está vazio" do
      # Arrange
      address = Address.new(
        street: "Avenida Paulista",
        number: "123",
        neighborhood: "Centro",
        city: "São Paulo",
        state: "",
        postal_code: "12345-678",
        country: "Brasil",
        complement: "Apto 101",
        user: User.new,
      )
      # Act
      result = address.valid?
      # Assert
      expect(result).to eq false
    end

    it "falso quando o CEP está vazio" do
      # Arrange
      address = Address.new(
        street: "Avenida Paulista",
        number: "123",
        neighborhood: "Centro",
        city: "São Paulo",
        state: "SP",
        postal_code: "",
        country: "Brasil",
        complement: "Apto 101",
        user: User.new,
      )
      # Act
      result = address.valid?
      # Assert
      expect(result).to eq false
    end

    it "falso quando o país está vazio" do
      # Arrange
      address = Address.new(
        street: "Avenida Paulista",
        number: "123",
        neighborhood: "Centro",
        city: "São Paulo",
        state: "SP",
        postal_code: "12345-678",
        country: "",
        complement: "Apto 101",
        user: User.new,
      )
      # Act
      result = address.valid?
      # Assert
      expect(result).to eq false
    end

    it "verdadeiro quando o complemento está vazio" do
      # Arrange
      address = Address.new(
        street: "Avenida Paulista",
        number: "123",
        neighborhood: "Centro",
        city: "São Paulo",
        state: "SP",
        postal_code: "12345-678",
        country: "Brasil",
        complement: "",
        user: User.new,
      )
      # Act
      result = address.valid?
      # Assert
      expect(result).to eq true
    end

    describe "#full_address" do
      it "exibe o endereço completo com complemento" do
        # Arrange
        address = Address.new(
          street: "Avenida Paulista",
          number: "123",
          neighborhood: "Centro",
          city: "São Paulo",
          state: "SP",
          postal_code: "12345-678",
          country: "Brasil",
          complement: "Apto 101",
          user: User.new,
        )
        # Act
        result = address.full_address()
        # Assert
        expect(result).to eq("Avenida Paulista, 123, Apto 101, Centro, São Paulo - SP, 12345-678 - Brasil
        ")
      end

      it "exibe o endereço completo sem complemento" do
        # Arrange
        address = Address.new(
          street: "Avenida Paulista",
          number: "123",
          neighborhood: "Centro",
          city: "São Paulo",
          state: "SP",
          postal_code: "12345-678",
          country: "Brasil",
          user: User.new,
        )
        # Act
        result = address.full_address()
        # Assert
        expect(result).to eq("Avenida Paulista, 123, Centro, São Paulo - SP, 12345-678 - Brasil
        ")
      end
    end
  end
end
