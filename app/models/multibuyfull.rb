class Multibuyfull < ApplicationRecord
  has_many :multibuyfullbuyproducts, dependent: :destroy
  has_many :multibuyfullgiveproducts, dependent: :destroy
end
