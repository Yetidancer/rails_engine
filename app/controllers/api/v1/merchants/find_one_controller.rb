class Api::V1::Merchants::FindOneController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.all.filter_by_name(params[:name]).first)
  end

end
