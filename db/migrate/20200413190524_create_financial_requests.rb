class CreateFinancialRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_requests do |t|
      t.integer :money_needed
      t.string :title
      t.string :description
      t.string :venmo_name
      t.integer :worker_id

      t.timestamps
    end
  end
end
