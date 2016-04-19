class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :image_url
      t.text :caption
      t.json :location
      t.belongs_to :dog, foreign_key: true

      t.timestamps
    end
  end
end
