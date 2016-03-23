class Package < ActiveRecord::Base
  belongs_to :client

  # Search
  def self.search(search)
		key = "%#{search}%"
    if search
      where(["package_dimentions LIKE :search OR package_weight LIKE :search OR safeguard_time LIKE :search OR outbound_packet LIKE :search OR entry_packet LIKE :search OR delivered_package LIKE :search OR barcode_packet LIKE :search OR batch_number LIKE :search ", search: key])
    else
      all
    end
  end

end
