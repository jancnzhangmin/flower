class Limitactive < ApplicationRecord
  has_many :limitactivedetails,dependent: :destroy
end
