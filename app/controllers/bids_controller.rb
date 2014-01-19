class BidsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @bid = @product.bids.build(params[:bid])
    respond_to do |format|
      if @bid.save
        format.html { render partial:"products/product_container",product:@product, layout: false, notice: 'Bid Submitted!' }
      else
        format.html { render partial:"products/product_container", locals:{product:@product}, layout: false}
      end
    end
  end
end
