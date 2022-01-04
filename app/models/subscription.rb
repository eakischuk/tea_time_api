class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: true
  validates :frequency, presence: true, numericality: true

  has_many :customer_subscriptions
end
