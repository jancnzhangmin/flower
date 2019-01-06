class Order < ApplicationRecord
  belongs_to :user
  has_many :orderdetails, dependent: :destroy
  has_many :enaccounts
end
