class Admin::ContactsController < ApplicationController
  before_filter :authenticate_user!
  active_scaffold :"contact" do |conf|
    conf.columns = [:first_name, :last_name,  :phone,:address_1, :address_2]
  end
end
