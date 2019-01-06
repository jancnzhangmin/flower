class Orderdetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_many :orderactivetypes, dependent: :delete_all
  has_many :orderoptionals, dependent: :delete_all
end
