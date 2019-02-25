class Sysqr < ApplicationRecord
  has_attached_file :sysqr, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :sysqr
end
