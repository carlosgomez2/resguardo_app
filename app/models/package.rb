class Package < ActiveRecord::Base
  belongs_to :client

  # Search
  def self.search(search)
		key = "%#{search}%"
    if search
      where(["package_dimentions LIKE :search OR package_weight LIKE :search OR safeguard_time LIKE :search OR outbound_packet_time LIKE :search OR entry_packet_time LIKE :search OR batch_number LIKE :search ", search: key])
    else
      all
    end
  end


end
