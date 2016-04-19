class AddImageColumnsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :image, :attachment
  end
end
