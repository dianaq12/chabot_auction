class ProductsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @bidder = Base64.decode64(params[:m]) if params[:m]
    @active_tab = cookies[:product_tab].present? ? cookies[:product_tab] : Category.first.name.gsub(" ","_")
    @categories = Category.all
  end

  def show
  end
end
