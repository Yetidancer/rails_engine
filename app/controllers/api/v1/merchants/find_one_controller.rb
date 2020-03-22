class Api::V1::Merchants::FindOneController < ApplicationController

  def show
    # render json: MerchantSerializer.new(Merchant.all.filter_by_name(params[:name]).first)

    filtering_params(params).each do |attr, query|
      render json: MerchantSerializer.new(
        Merchant.all.public_send("filter_by_#{attr}", query).first) if query.present?

    end
  end

  private
    def filtering_params(params)
      params.slice(:name, :updated_at, :created_at)
    end

end
