class CreatePostHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :post_hashtags do |t|
      t.integer :post_id
      t.integer :hashtag_id

      t.timestamps
    end
    add_index :post_hashtags, :post_id
    add_index :post_hashtags, :hashtag_id
    add_index :post_hashtags, [:post_id, :hashtag_id], unique: true
  end
end
