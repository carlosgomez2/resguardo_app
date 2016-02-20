class Client < ActiveRecord::Base
  has_many :packages, dependent: :destroy

  # Search
  def self.search(search)
		key = "%#{search}%"
    if search
      where(["first_name LIKE :search OR second_name LIKE :search OR last_name LIKE :search OR second_last_name LIKE :search OR principal_phone LIKE :search OR cellphone LIKE :search OR email LIKE :search OR birth LIKE :search OR address LIKE :search OR postal_code LIKE :search OR city LIKE :search OR state LIKE :search OR emergency_contact_full_name LIKE :search OR emergency_contact_address LIKE :search OR emergency_contact_phone LIKE :search", search: key])
    else
      all
    end
  end
  
end
