class Address < ApplicationRecord
  belongs_to :user
  validates :street, :number, :neighborhood, :city, :state, :postal_code, :country, presence: true

  def full_address
    address_parts = [
      street,
      number,
      (complement if complement.present?),
      neighborhood,
      "#{city} - #{state}",
      postal_code,
      country,
    ].compact

    address_parts.join(", ").gsub(", ,", ",")
    # O método gsub(', ,', ',') é usado para substituir todas as ocorrências de uma vírgula dupla seguida de espaço , , por uma única vírgula ,.
  end
end
