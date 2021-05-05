class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :introduction, foreign_key: true
      t.integer :voter_id
      t.timestamps
    end
  end
end
