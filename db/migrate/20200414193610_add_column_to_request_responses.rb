class AddColumnToRequestResponses < ActiveRecord::Migration[6.0]
  def change
    add_column :request_responses, :message, :string
    add_column :request_responses, :amount, :integer
  end
end
