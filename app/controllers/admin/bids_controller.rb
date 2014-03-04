class Admin::BidsController < ApplicationController
  before_filter :authenticate_user!
  active_scaffold :"bid" do |conf|
    conf.columns = [:product, :email,:amount]
    conf.list.columns = [:product, :email,:amount, :created_at]
  end
end
