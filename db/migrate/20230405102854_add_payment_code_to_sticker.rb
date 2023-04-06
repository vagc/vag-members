class AddPaymentCodeToSticker < ActiveRecord::Migration[7.0]
  def change
    add_column :stickers, :payment_code, :string
  end
end
