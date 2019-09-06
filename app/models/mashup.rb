class Mashup < ApplicationRecord
  has_many :mashupbuyproducts, dependent: :destroy
end
