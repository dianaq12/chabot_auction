class Admin::CategoriesController < ApplicationController
  before_filter :authenticate_user!
  active_scaffold :"category" do |conf|
  end
end