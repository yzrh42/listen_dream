class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.datetime :date, null: false
      t.string :image
      t.text :body, null: false
      t.references :user, foreign_key: true
    
      t.timestamps
    end
  end
end
