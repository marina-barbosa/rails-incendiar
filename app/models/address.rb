class Address < ApplicationRecord
  belongs_to :user
  validates :street, :number, :neighborhood, :city, :state, :postal_code, :country, presence: true
end
