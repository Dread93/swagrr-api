class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :post_id, foreign_key: true
      t.integer :dog_id, foreign_key: true

      t.timestamps
    end
    add_index :likes, :post_id
    add_index :likes, :dog_id
    add_index :likes, [:post_id, :dog_id], unique: true
  end
end
