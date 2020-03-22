class Api::V1::Merchants::FindOnesController < ApplicationController

  def show
    # if params[:search].blank?
    #   redirect_to '/merchants'
    # else
    #   require "pry"; binding.pry
    #   @query = params[:search].downcase
    #   render json: MerchantSerializer.new(Merchant.all.where("lower(name) LIKE :search", search: @query))
    # end
    render json: MerchantSerializer.new(Merchant.all.filter_by_name(params[:name]).first)
  end

end
