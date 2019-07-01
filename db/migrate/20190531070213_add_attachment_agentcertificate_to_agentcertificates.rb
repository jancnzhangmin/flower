class AddAttachmentAgentcertificateToAgentcertificates < ActiveRecord::Migration[5.2]
  def self.up
    change_table :agentcertificates do |t|
      t.attachment :agentcertificate
    end
  end

  def self.down
    remove_attachment :agentcertificates, :agentcertificate
  end
end
