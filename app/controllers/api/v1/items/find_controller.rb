class Api::V1::Items::FindController < ApplicationController

  def show
    results = 0
    filtering_params(params).each do |attr, query|
      results = ItemSerializer.new(
        Item.all.public_send("filter_by_#{attr}", query).first) if query.present?
    end
    render json: results
  end

  def index
    results = 0
    filtering_params(params).each do |attr, query|
      results = ItemSerializer.new(
        Item.all.public_send("filter_by_#{attr}", query)) if query.present?
    end
    render json: results
  end

  private
    def filtering_params(params)
      params.slice(:name, :description, :unit_price, :merchant_id, :updated_at, :created_at)
    end

end
