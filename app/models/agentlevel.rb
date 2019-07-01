class Agentlevel < ApplicationRecord
  has_many :agentprices
  has_many :users
end
