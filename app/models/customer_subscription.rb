class CustomerSubscription < ApplicationRecord
  validates :tea_name, presence: true
  validates :status, presence: true

  belongs_to :customer
  belongs_to :subscription
end
