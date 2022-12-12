class Order < ApplicationRecord

  belongs_to :customer
  enum payment_method: {credit_card:0, transfer:1}
  enum status: {not_paid:0, have_paid:1, producing_now:2, shipping_preparation:3, have_shipped:4}

end
