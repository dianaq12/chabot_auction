class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!

  active_scaffold :"product" do |conf|

    conf.columns = [:category,:name,:description,:photo_url, :large_photo_url, :base_value, :min_bid, :bid_increment,  :donor_name, :contact_id,:open_on_formatted,  :close_on_formatted,:high_bidder_email]
    conf.list.columns = [:category, :name, :high_bidder_email, :highest_bid_amount,:open_on_formatted, :bids, :close_on_formatted, :paid, :invoiced, :active]
    conf.update.columns = [:category,:name,:description,:photo_url, :large_photo_url, :base_value, :min_bid, :bid_increment,  :donor_name, :contact_id,:active, :open_on_formatted,  :close_on_formatted]
    conf.create.columns = [:category,:name,:description,:photo_url, :large_photo_url, :base_value, :min_bid, :bid_increment,  :donor_name, :contact_id,:active, :open_on_formatted,  :close_on_formatted]

    conf.columns[:close_on_formatted].label = "Close On"
    conf.columns[:open_on_formatted].label = "Open On"

    conf.columns[:paid].inplace_edit = true
    conf.columns[:invoiced].inplace_edit = true

    conf.columns[:active].sort_by :method => 'active?'
    conf.columns[:high_bidder_email].sort_by :method => 'high_bidder_email'
    conf.columns[:open_on_formatted].sort_by :method => 'open_on'
    conf.columns[:close_on_formatted].sort_by :method => 'close_on'

    conf.list.pagination = false
  end

  def before_update_save(record)


  end
  def before_create_save(record)

  end

  def custom_finder_options
    # {:reorder => "categories.name DESC, another_field ASC NULLS LAST"}
    {:reorder => "categories.name ASC, products.name ASC, products.active"}
  end
end
