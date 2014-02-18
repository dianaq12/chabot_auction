class Bid < ActiveRecord::Base
  attr_accessible :amount, :email, :product_id

  belongs_to :product

  validates_presence_of :email, message: " - You must login from the Parent Portal and hit the Auction link"

  validate :bid_amount, :product_open?

  scope :highest, order("amount DESC").limit(1)

  after_create :deliver_emails
  before_create :current_high_bid

  def bid_amount
    if amount.blank? || amount < product.minimum_bid
      errors.add(:amount, "must be more than min. amount")
    end
  end
  def product_open?
    product.open?
  end
private
  def deliver_emails
    BidMailer.confirmation(self).deliver
    BidMailer.out_bid(@original_high_bid).deliver if  @original_high_bid
  end
  def current_high_bid
    highest_bid = self.product.bids.highest
    @original_high_bid = highest_bid.first if highest_bid.count > 0
  end
end
