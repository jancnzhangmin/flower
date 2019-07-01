class Secondactive < ApplicationRecord
  has_many :secondactivedetails, dependent: :destroy
end
