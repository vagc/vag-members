class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :registered_time
      t.string :name
      t.string :car_registration
      t.string :make
      t.string :model
      t.string :dob
      t.string :phone_number
      t.string :payment_code
      t.string :email
      t.string :emergency_contact
      t.float :amount_paid

      t.timestamps
    end
  end
end
