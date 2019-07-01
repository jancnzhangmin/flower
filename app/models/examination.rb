class Examination < ApplicationRecord
  has_many :examinationdetails
  belongs_to :user
end
