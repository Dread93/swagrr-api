class AddAvatarColumnsToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :avatar, :attachment
  end
end
