class CreateIntroductions < ActiveRecord::Migration[5.2]
  def change
    create_table :introductions do |t|
      t.string :name
      t.string :contents
      t.string :tags
      t.integer :good
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
