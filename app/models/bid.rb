class Bid < ActiveRecord::Base
  attr_accessible :amount, :email, :product_id

  belongs_to :product

  validates_presence_of :email, message: " - You must login from the Parent Portal and hit the Auction link"

  validate :bid_amount, :product_still_open?

  scope :highest, order("amount DESC").limit(1)

  def bid_amount
    if amount.blank? || amount < product.minimum_bid
      errors.add(:amount, "must be more than min. amount")
    end
  end
  def product_open?
    product.open?
  end
end
