require "rails_helper"

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "#valid?" do
    it "deve ter um codigo" do
    end

    it "data estimada de entrega deve ser orbigatória" do
      # it "nao pode ser no passado" do
      # Arrange
      order = Order.new(estimated_deliver_date: "")
      # Act
      order.valid?
      result = order.errors.include? (:estimated_deliver_date)
      # Assert
      expect(result).to be true
    end

    it "nao pode ser no passado" do
      # Arrange
      order = Order.new(estimated_delivery_date: 1.day.ago)
      # Act
      order.valid?
      result = order.errors.include? (:estimated_deliver_date)
      # Assert
      expect(result).to be true
      expect(order.errors[:estimated_delivery_date]).to include(" deve ser futura.")
    end

    it "nao pode ser igual a hoje" do
      # Arrange
      order = Order.new(estimated_delivery_date: Date.today)
      # Act
      order.valid?
      result = order.errors.include? (:estimated_deliver_date)
      # Assert
      expect(result).to be true
      expect(order.errors[:estimated_delivery_date]).to include(" deve ser futura.")
    end

    it "data deve ser igual ou maior que amnhã" do
      # Arrange
      order = Order.new(estimated_delivery_date: 1.day.from_now)
      # Act
      order.valid?
      # Assert
      expect(result).to be false
    end
  end
  # describe "gera um código aleatório" do
  #   it "ao criar um novo pedido" do
  #     # Arrange
  #     # criar um pedido com todos os campos menos o codigo
  #     # Act
  #     # salvar
  #     # order.save!
  #     # result = order.code
  #     # Assert
  #     # espero que o pedido tenha um codigo aleatorio criado automaticamente
  #     # expect(result).not_to be_empty
  #     # expect(result.lenght).to eq 8
  #   end
  #   # it "e o codigo é unico"
  # expect(first_order.code).not_to be_empty
  # expect(first_order.code).not_to be_nil
  # expect(first_order.code.length).to eq 10
  # expect(second_order.code).not_to eq first_order.code
  # end
end
