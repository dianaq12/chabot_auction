class ProductsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @bidder = params[:m]
    @categories = Category.all
  end

  def show
  end
end
