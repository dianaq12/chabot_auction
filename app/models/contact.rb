class Contact < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :first_name, :last_name, :phone
end
