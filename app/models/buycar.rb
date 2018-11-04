class Buycar < ApplicationRecord
  belongs_to :user
  has_many :buycaroptionals
end
