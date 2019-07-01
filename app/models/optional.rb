class Optional < ApplicationRecord
  belongs_to :product
  has_many :conditions

end
