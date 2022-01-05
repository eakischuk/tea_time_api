require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many(:customer_subscriptions) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'instance methods' do
    it '#full_name' do
      customer = Customer.create(first_name: "Gideon",
        last_name: "Nav",
        email: "swordsb4bones@example.com",
        address: "1234 Bottom Circle, 9th House")

      expect(customer.full_name).to eq("Gideon Nav")
    end
  end
end
