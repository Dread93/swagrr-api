class CreateMentions < ActiveRecord::Migration[5.0]
  def change
    create_table :mentions do |t|
      t.integer :post_id
      t.integer :dog_id

      t.timestamps
    end
    add_index :mentions, :post_id
    add_index :mentions, :dog_id
    add_index :mentions, [:post_id, :dog_id], unique: true
  end
end
