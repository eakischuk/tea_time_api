class Customer < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :customer_subscriptions

  def full_name
    "#{first_name} #{last_name}"
  end
end
