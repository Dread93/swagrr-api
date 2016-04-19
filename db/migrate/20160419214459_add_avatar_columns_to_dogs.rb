class AddAvatarColumnsToDogs < ActiveRecord::Migration[5.0]
  def change
    add_attachment :dogs, :avatar
  end
end
