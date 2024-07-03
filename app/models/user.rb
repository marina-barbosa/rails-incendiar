class User < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  validates :email, :cpf, uniqueness: true
  validates :name, :email, :cpf, :phone, :role, presence: true

  enum role: { customer: 0, admin: 1 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    self.role == "admin"
  end

  def description
    "#{name} - <#{email}>"
  end
end
