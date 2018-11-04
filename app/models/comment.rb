class Comment < ApplicationRecord
  belongs_to :product
  has_many :childrens, class_name: "Comment", foreign_key: "up_id"
  belongs_to :parent, class_name: "Comment", foreign_key: "up_id", optional: true
  belongs_to :user
end
