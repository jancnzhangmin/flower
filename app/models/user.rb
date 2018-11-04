class User < ApplicationRecord
  has_many :stayincomes
  has_many :withdrawrecords
  has_many :collections
  has_many :comments
  has_many :receiptaddrs
  has_many :orders
  has_many :buycars
  has_many :banks
  has_many :owerstayincomes
  has_many :userfirstbuystatus
end
