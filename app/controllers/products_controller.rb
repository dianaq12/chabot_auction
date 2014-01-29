class ProductsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @bidder = Base64.decode64(params[:m]) if params[:m]
    @categories = Category.all
  end

  def show
  end
end
