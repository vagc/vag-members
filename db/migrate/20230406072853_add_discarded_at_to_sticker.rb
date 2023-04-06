class AddDiscardedAtToSticker < ActiveRecord::Migration[7.0]
  def change
    add_column :stickers, :discarded_at, :datetime
    add_index :stickers, :discarded_at
  end
end
