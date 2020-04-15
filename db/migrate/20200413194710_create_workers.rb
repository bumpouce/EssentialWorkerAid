class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :username
      t.string :password_digest
      t.string :full_name
      t.integer :stress
      t.integer :dependents
      t.string :field_of_work
      t.string :neighborhood

      t.timestamps
    end
  end
end
