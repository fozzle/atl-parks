class ParksController < ApplicationController
  respond_to :json

  def index
    @parks = Park.with_amenities(params)
    @parks = @parks.near(params[:q], 30) if params[:q].present?

    begin
      page = Integer(params[:page])
    rescue Exception
      page = 1
    end

    @parks = @parks.page(page)

    respond_to do |format|
      format.json { render json: @parks, callback: params[:callback] }
    end
  end

  def show
    @park = Park.find(params[:id])

    respond_to do |format|
      format.json { render json: @park, callback: params[:callback] }
    end
  end
end
