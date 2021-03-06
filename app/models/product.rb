
class Product < ActiveRecord::Base
  attr_accessible :base_value, :bid_increment, :category_id, :contact_id, :description, :donor_name, :min_bid, :name, :photo_url, :short_description, :close_on, :open_on_formatted, :close_on_formatted, :paid, :active

  belongs_to :category
  has_many :bids, dependent: :destroy
  belongs_to :contact
  DATE_FORMAT = "%m/%d/%Y %I:%M %p"

  validates_presence_of :base_value, :bid_increment, :description, :close_on, :open_on, :min_bid, :category_id

  scope :active, where(active: true)

  def close_on_formatted= formatted_date
    return unless formatted_date.present?
    self.close_on = Chronic.parse(formatted_date)
  end

  def close_on_formatted
    self.close_on.strftime(DATE_FORMAT) if self.close_on.present?
  end

  def open_on_formatted= formatted_date
    return unless formatted_date.present?
    self.open_on = Chronic.parse(formatted_date)
  end

  def open_on_formatted
    self.open_on.strftime(DATE_FORMAT) if self.open_on.present?
  end

  def high_bidder_email
    self.bids.highest.first.try(:email)
  end

  def closed?
    Time.now >= self.close_on
  end

  def open?
    Time.now >= self.open_on && Time.now <= self.close_on
  end

  # needed so that the column is sortable in ActiveScaffold table.
  def active?
    self.active ? 1 : 0
  end

  def minimum_bid
    return self.min_bid unless self.bids.highest.first
    self.bids.highest.first.amount + self.bid_increment
  end

  def high_bidder?(bidder)
    bidder && high_bidder_email && high_bidder_email == bidder
  end

  def highest_bid_amount
    self.bids.highest.first.present? ? self.bids.highest.first.amount : 0
  end
end
