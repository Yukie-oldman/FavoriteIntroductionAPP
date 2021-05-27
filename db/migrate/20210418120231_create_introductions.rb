class CreateIntroductions < ActiveRecord::Migration[5.2]

  def change
    create_table :introductions do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :caption
      t.string :buf_tags
      t.string :contents
      t.string :image1
      t.string :image2
      t.string :image3
      
      t.timestamps
    end
  end
end
