json.array!(@clients) do |client|
  json.extract! client, :id, :first_name, :second_name, :last_name, :second_last_name, :principal_phone, :cellphone, :email, :birth, :address, :postal_code, :city, :state, :emergency_contact_full_name, :emergency_contact_address, :emergency_contact_phone
  json.url client_url(client, format: :json)
end
