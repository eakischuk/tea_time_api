class Api::V1::CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  attributes :tea_name, :status
  attribute :subscription do |customer_sub|
    subscription = Subscription.find(customer_sub.subscription_id)
    {
      title: subscription.title,
      price: subscription.price,
      frequency: subscription.frequency
    }
  end
  attribute :customer_name do |customer_sub|
    customer = Customer.find(customer_sub.customer_id)
    customer.full_name
  end
end
