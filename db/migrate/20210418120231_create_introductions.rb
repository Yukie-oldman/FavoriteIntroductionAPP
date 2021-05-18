class CreateIntroductions < ActiveRecord::Migration[5.2]

  def change
    create_table :introductions do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :caption
      t.string :buf_tags
      t.string :contents
      t.string :image1_id
      t.string :image2_id
      t.string :image3_id
      
      t.timestamps
    end
  end
end
