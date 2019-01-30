class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_many :commentimgs, dependent: :destroy
end
