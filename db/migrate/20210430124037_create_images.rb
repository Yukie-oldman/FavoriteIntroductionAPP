class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :introduction, foreign_key: true
      t.string :image_name
      t.timestamps
    end
  end
end
