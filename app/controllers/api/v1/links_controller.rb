class Api::V1::LinksController < ApplicationController
  def create
    @link = Link.new(shortener_params)

    if @link.save
      render json: {
        data: @link
      }, status: :created
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  def show
    @link = Link.find_by_slug(params[:slug])

    if @link.nil?
      render json: {
        message: '404 error, please check your broken link!'
      }, status: :not_found
    else
      redirect_to @link.url
    end
  end

  private

  def shortener_params
    params.permit(:url, :slug)
  end
end
