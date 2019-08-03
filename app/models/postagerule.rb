class Postagerule < ApplicationRecord
  has_many :postareas, dependent: :destroy
end
