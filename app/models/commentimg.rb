class Commentimg < ApplicationRecord
  belongs_to :comment
  has_attached_file :commentimg, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :commentimg
end
