class Agent < ApplicationRecord
  belongs_to :user
  has_many :agentcertificates, dependent: :destroy
end
