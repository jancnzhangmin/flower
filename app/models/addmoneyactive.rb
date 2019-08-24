class Addmoneyactive < ApplicationRecord
  has_many :addmoneybuyproducts, dependent: :destroy
  has_many :addmoneygiveproducts, dependent: :destroy
end
