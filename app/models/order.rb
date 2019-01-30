class Order < ApplicationRecord
  belongs_to :user
  has_many :orderdetails, dependent: :destroy
  has_many :enaccounts
  has_many :orderdelivers, dependent: :destroy
  has_many :comments, dependent: :destroy
end
