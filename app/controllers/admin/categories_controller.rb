class Admin::CategoriesController < ApplicationController
  skip_before_filter :authenticate_user!
  active_scaffold :"category" do |conf|
  end
end