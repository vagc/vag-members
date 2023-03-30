class CreateStickers < ActiveRecord::Migration[7.0]
  def change
    create_table :stickers do |t|
      t.references :member, null: false, foreign_key: true, unique: true
      t.integer :sticker_number
      t.string :sticker_variation

      t.timestamps
    end
  end
end
