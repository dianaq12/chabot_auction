class BidMailer < ActionMailer::Base

  FIRST5_EMAIL_ADDRESS="president@chabotparentsclub.org"
  default from: FIRST5_EMAIL_ADDRESS

  def confirmation(bid)
    @bid = bid
    @email = bid.email
    mail( to:             @email,
          subject:        "Bid Confirmation: #{@bid.product.name}"
    )
  end

  def out_bid(bid)
    @bid = bid
    @email = bid.email
    mail( to:             @email,
          subject:        "Out Bid Notice: #{@bid.product.name}"
    )
  end
end