class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :breed, foreign_key: true
      t.string :avatar_url
      t.string :name
      t.string :bio
      t.integer :sex
      t.string :website

      t.timestamps
    end
  end
end
