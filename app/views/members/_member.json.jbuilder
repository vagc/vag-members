json.extract! member, :id, :registered_time, :name, :car_registration, :make, :model, :dob, :phone_number, :payment_code, :email, :emergency_contact, :amount_paid, :created_at, :updated_at
json.url member_url(member, format: :json)
