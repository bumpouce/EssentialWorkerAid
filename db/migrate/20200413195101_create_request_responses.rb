class CreateRequestResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :request_responses do |t|
      t.integer :request_id
      t.integer :supporter_id
      t.string :status

      t.timestamps
    end
  end
end
