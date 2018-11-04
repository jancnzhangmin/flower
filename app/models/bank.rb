class Bank < ApplicationRecord
  belongs_to :bankdef
  belongs_to :user
end
