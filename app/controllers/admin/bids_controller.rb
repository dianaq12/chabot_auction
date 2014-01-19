class Admin::BidsController < ApplicationController
  before_filter :authenticate_user!
  active_scaffold :"bid" do |conf|
    conf.columns = [:product, :email,:amount]
  end
end
