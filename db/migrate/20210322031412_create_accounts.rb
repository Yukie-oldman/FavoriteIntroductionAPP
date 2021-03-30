class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.string :summary
      t.string :category
      t.integer :price
      t.string :description
      t.string :tags
      t.datetime :cashed_on
      t.timestamps
    end
  end
end
