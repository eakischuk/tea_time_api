class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create
    customer_sub = CustomerSubscription.create(new_sub_params)
    render json: CustomerSubscriptionSerializer.new(customer_sub), status: :created
  end

  private

  def customer_sub_params
    params.require(:subscription).permit(:email, :subscription_id, :tea_name)
  end

  def new_sub_params
    customer = Customer.find_by(email: customer_sub_params[:email])
    {
      customer_id: customer.id,
      subscription_id: customer_sub_params[:subscription_id],
      tea_name: customer_sub_params[:tea_name],
      status: 'active'
    }
  end
end
