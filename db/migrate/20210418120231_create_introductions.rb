class CreateIntroductions < ActiveRecord::Migration[5.2]

  def change
    create_table :introductions do |t|
      t.string :caption
      t.string :name
      t.string :contents
      t.string :buf_tags
      t.integer :good
      t.string :image1_id
      t.string :image2_id
      t.string :image3_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
