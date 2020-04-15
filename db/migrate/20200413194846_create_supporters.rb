class CreateSupporters < ActiveRecord::Migration[6.0]
  def change
    create_table :supporters do |t|
      t.string :username
      t.string :password_digest
      t.string :full_name

      t.timestamps
    end
  end
end
