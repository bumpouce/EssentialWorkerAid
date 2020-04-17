class CreateKudos < ActiveRecord::Migration[6.0]
  def change
    create_table :kudos do |t|
      t.string :profession
      t.string :title
      t.string :comment
      t.string :supporter_id

      t.timestamps
    end
  end
end
