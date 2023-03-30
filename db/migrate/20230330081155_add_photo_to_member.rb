class AddPhotoToMember < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :photo, :string
  end
end
