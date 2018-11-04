class Productimg < ApplicationRecord
  belongs_to :product
  has_attached_file :productimg, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :productimg
end
