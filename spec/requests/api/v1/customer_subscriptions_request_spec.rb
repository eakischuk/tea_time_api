require 'rails_helper'

RSpec.describe 'CustomerSubscriptions requests' do
  before(:each) do
    @customer = Customer.create(first_name: "Gideon", last_name: "Nav", email: "swordsb4bones@example.com", address: "1234 Bottom Circle, 9th House")
    @subscription_1 = Subscription.create(title: "A tea a day", price: 25.0, frequency: 1)
  end
  describe 'happy paths' do
    it 'creates new customer subscription' do
      customer_sub_params = {
        email: @customer.email,
        subscription_id: @subscription_1.id,
        tea_name: "black"
      }
      expect(@customer.customer_subscriptions.count).to eq(0)

      post "/api/v1/customer_subscriptions", params: {subscription: customer_sub_params}

      expect(response.status).to eq(201)
      expect(@customer.customer_subscriptions.count).to eq(1)
      new_sub = JSON.parse(response.body, symbolize_names: true)

      expect(new_sub).to be_a(Hash)
      expect(new_sub).to have_key(:data)
      expect(new_sub[:data]).to be_a(Hash)
      expect(new_sub[:data]).to have_key(:id)
      expect(new_sub[:data][:id]).to be_a(String)
      expect(new_sub[:data]).to have_key(:type)
      expect(new_sub[:data][:type]).to be_a(String)
      expect(new_sub[:data]).to have_key(:attributes)
      expect(new_sub[:data][:attributes]).to be_a(Hash)
      expect(new_sub[:data][:attributes]).to have_key(:tea_name)
      expect(new_sub[:data][:attributes][:tea_name]).to be_a(String)
      expect(new_sub[:data][:attributes]).to have_key(:status)
      expect(new_sub[:data][:attributes][:status]).to be_a(String)
      expect(new_sub[:data][:attributes]).to have_key(:customer_name)
      expect(new_sub[:data][:attributes][:customer_name]).to be_a(String)
      expect(new_sub[:data][:attributes]).to have_key(:subscription)
      expect(new_sub[:data][:attributes][:subscription]).to be_a(Hash)
      expect(new_sub[:data][:attributes][:subscription]).to have_key(:title)
      expect(new_sub[:data][:attributes][:subscription][:title]).to be_a(String)
      expect(new_sub[:data][:attributes][:subscription]).to have_key(:price)
      expect(new_sub[:data][:attributes][:subscription][:price]).to be_a(Float)
      expect(new_sub[:data][:attributes][:subscription]).to have_key(:frequency)
      expect(new_sub[:data][:attributes][:subscription][:frequency]).to be_an(Integer)
    end

    it 'updates customer subscription status' do
      customer_sub = @customer.customer_subscriptions.create(subscription_id: @subscription_1.id, tea_name: 'black', status: 'active')

      update_params = {
        status: 'cancelled'
      }

      patch "/api/v1/customer_subscriptions/#{customer_sub.id}", params: {subscription: update_params}

      expect(response.status).to eq(200)

      updated_sub = JSON.parse(response.body, symbolize_names: true)

      expect(updated_sub).to be_a(Hash)
      expect(updated_sub).to have_key(:data)
      expect(updated_sub[:data]).to be_a(Hash)
      expect(updated_sub[:data]).to have_key(:id)
      expect(updated_sub[:data][:id]).to be_a(String)
      expect(updated_sub[:data][:id]).to eq(customer_sub.id.to_s)
      expect(updated_sub[:data]).to have_key(:type)
      expect(updated_sub[:data][:type]).to be_a(String)
      expect(updated_sub[:data]).to have_key(:attributes)
      expect(updated_sub[:data][:attributes]).to be_a(Hash)
      expect(updated_sub[:data][:attributes]).to have_key(:tea_name)
      expect(updated_sub[:data][:attributes][:tea_name]).to be_a(String)
      expect(updated_sub[:data][:attributes]).to have_key(:status)
      expect(updated_sub[:data][:attributes][:status]).to be_a(String)
      expect(updated_sub[:data][:attributes][:status]).to eq('cancelled')
      expect(updated_sub[:data][:attributes]).to have_key(:customer_name)
      expect(updated_sub[:data][:attributes][:customer_name]).to be_a(String)
      expect(updated_sub[:data][:attributes]).to have_key(:subscription)
      expect(updated_sub[:data][:attributes][:subscription]).to be_a(Hash)
      expect(updated_sub[:data][:attributes][:subscription]).to have_key(:title)
      expect(updated_sub[:data][:attributes][:subscription][:title]).to be_a(String)
      expect(updated_sub[:data][:attributes][:subscription]).to have_key(:price)
      expect(updated_sub[:data][:attributes][:subscription][:price]).to be_a(Float)
      expect(updated_sub[:data][:attributes][:subscription]).to have_key(:frequency)
      expect(updated_sub[:data][:attributes][:subscription][:frequency]).to be_an(Integer)
    end
  end
  describe 'sad paths' do
  end
end
