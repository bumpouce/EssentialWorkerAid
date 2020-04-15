class AddColumnToFinancialRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :financial_requests, :status, :string
  end
end
