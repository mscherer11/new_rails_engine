class Api::V1::Customers::FavoriteMerchantsController < ApplicationController

  def show
    render json: Customer.find(params[:customer_id]).favorite_merchant
  end

end
