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
  has_many :enaccounts
  has_many :childrens, class_name: "User", foreign_key: "up_id"
  belongs_to :parent, class_name: "User", foreign_key: "up_id", optional: true
  belongs_to :agentlevel, optional: true
  has_many :agentpaymentrecorders
  has_one :agent, dependent: :destroy
  has_many :examinations

  has_secure_password :validations => false

  after_create :createagent, on: :create
  after_save :saveagent, on: :update

  private

  def createagent
    self.create_agent(agentpayment:self.agentpayment, phone:self.phone, showphone:0, autoupgrade:0, examination:0)
  end

  def saveagent
    self.agent.agentpayment = self.agentpayment
    self.agent.save
  end

end
