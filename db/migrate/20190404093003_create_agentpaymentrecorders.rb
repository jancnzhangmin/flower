class CreateAgentpaymentrecorders < ActiveRecord::Migration[5.2]
  def change
    create_table :agentpaymentrecorders do |t|
      t.bigint :user_id
      t.float :agentpayment
      t.string :summary
      t.datetime :paymenttime

      t.timestamps
    end
  end
end
