class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shipping_address, class_name: "Address", optional: true

  validate :estimated_delivery_date_is_future

  before_create :generate_code

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(10).upcase if self.code.nil?
  end

  def estimated_delivery_date_is_future
    if self.estimated_delivery_date.present? && self.estimated_delivery_date <= Date.today
      self.errors.add(:estimated_delivery_date, " deve ser futura.")
    end
  end
end
