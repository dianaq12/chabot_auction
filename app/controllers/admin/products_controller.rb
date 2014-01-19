class Admin::ProductsController < ApplicationController
  skip_before_filter :authenticate_user!

  active_scaffold :"product" do |conf|

    conf.columns = [:base_value, :bid_increment, :category, :contact_id, :description, :donor_name, :min_bid, :name, :photo_url, :short_description, :close_on_formatted,:open_on_formatted]
    #conf.list.columns = [:title, :resource_format, :status, :updated_at,:topic_list_tags]

    conf.columns[:close_on_formatted].label = "Close On"
    conf.columns[:open_on_formatted].label = "Open On"
  end

  def before_update_save(record)


  end
  def before_create_save(record)

  end
end
