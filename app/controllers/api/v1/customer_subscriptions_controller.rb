class Api::V1::CustomerSubscriptionsController < ApplicationController
  def create
    customer_sub = CustomerSubscription.create(new_sub_params)
    render json: Api::V1::CustomerSubscriptionSerializer.new(customer_sub), status: :created
  end

  def update
    customer_sub = CustomerSubscription.find(params[:id])
    customer_sub.update(customer_sub_params)
    render json: Api::V1::CustomerSubscriptionSerializer.new(customer_sub), status: :ok
  end

  def index
    customer = Customer.find_by(email: params[:email])
    customer_subs = customer.customer_subscriptions
    render json: Api::V1::CustomerSubscriptionSerializer.new(customer_subs), status: :ok
  end

  private

  def customer_sub_params
    params.require(:subscription).permit(:email, :subscription_id, :tea_name, :status)
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
