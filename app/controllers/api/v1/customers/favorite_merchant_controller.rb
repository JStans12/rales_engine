class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    render json: Merchant.find(Merchant.favorite_merchant(params[:customer_id]))
  end

end