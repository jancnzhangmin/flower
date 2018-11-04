class Product < ApplicationRecord
  has_many :buyfullactivedetails
  has_many :secondactivedetails
  has_and_belongs_to_many :clas
  belongs_to :manufacturer
  has_many :optionals
  has_many :productimgs
  has_many :comments
  has_many :collections
  has_many :orderdetails
  has_many :limitactivedetails
  has_many :firstbuyactivedetails
end
