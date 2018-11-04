class Buycaroptional < ApplicationRecord
  belongs_to :buycar
  has_many :conditions
end
