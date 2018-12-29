class Buycar < ApplicationRecord
  belongs_to :user
  has_many :buycaroptionals, dependent: :delete_all
  has_many :activetypes, dependent: :delete_all
end
