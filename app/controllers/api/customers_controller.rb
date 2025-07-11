class Api::CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: customers
  end

  def show
    customer = Customer.find(params[:id])
    if params[:with] == "cars"
    render json: customer.as_json(include: :cars)
    else
      render json: customer
    end
  end
end
