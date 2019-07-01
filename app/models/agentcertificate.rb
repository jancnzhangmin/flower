class Agentcertificate < ApplicationRecord
  belongs_to :agent
  has_attached_file :agentcertificate, :url => "/:attachment/:id/:basename.:extension",  :path => ":rails_root/public/:attachment/:id/:basename.:extension"
  do_not_validate_attachment_file_type :agentcertificate
end
