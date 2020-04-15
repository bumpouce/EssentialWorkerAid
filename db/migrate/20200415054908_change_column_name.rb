class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :request_responses, :request_id, :financial_request_id
  end
end
