class BidsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @bid = @product.bids.build(params[:bid])
    @bidder = params[:bid][:email]
    respond_to do |format|
      if @bid.save
        format.html do
          @bid = Bid.new
          render partial:"products/product_container",locals:{product:@product}, layout: false, notice: 'Bid Submitted!'
        end
      else
        format.html { render partial:"products/product_container", locals:{product:@product}, layout: false}
      end
    end
  end
end
