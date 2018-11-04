class Firstbuyactive < ApplicationRecord
  has_many :firstbuyactivedetails,dependent: :destroy
  has_many :userfirstbuystatus
end
