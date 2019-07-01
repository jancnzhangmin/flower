class Condition < ApplicationRecord
  belongs_to :optional
  has_attached_file :conditionimg, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :conditionimg
end
