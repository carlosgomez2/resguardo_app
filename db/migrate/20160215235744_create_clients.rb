class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :second_last_name
      t.string :principal_phone
      t.string :cellphone
      t.string :email
      t.date :birth
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :emergency_contact_full_name
      t.string :emergency_contact_address
      t.string :emergency_contact_phone

      t.timestamps null: false
    end
  end
end
