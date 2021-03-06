class Package < ActiveRecord::Base
  belongs_to :client

  # Search
  # def self.search(search)
	# 	key = "%#{search}%"
  #   if search
  #
  #     Package.where('barcode_packet LIKE ?', key).all
  #
  #     # where(["entry_packet LIKE :search OR outbound_packet LIKE :search OR package_dimentions LIKE :search OR package_weight LIKE :search OR delivered_package LIKE :search OR safeguard_time LIKE :search OR batch_number LIKE :search OR barcode_packet LIKE :search", search: key])
  #   else
  #     all
  #   end
  # end

  # def self.search(search)
	# 	key = "%#{search}%"
  #   if search
  #     results = Array.new
  #     Package.all.map{ |package| Package.where("barcode_packet LIKE :search", search: key).map {|package| results << package}}
  #     return results
  #     logger.debug results
  #     # where(["entry_packet LIKE :search OR outbound_packet LIKE :search OR package_dimentions LIKE :search OR package_weight LIKE :search OR delivered_package LIKE :search OR safeguard_time LIKE :search OR batch_number LIKE :search OR barcode_packet LIKE :search", search: key])
  #   else
  #     all
  #   end
  # end

  # Search
  def self.search(search)
		key = "%#{search}%"
    if search
      where(["entry_packet LIKE :search OR outbound_packet LIKE :search OR package_dimentions LIKE :search OR package_weight LIKE :search OR delivered_package LIKE :search OR safeguard_time LIKE :search OR batch_number LIKE :search OR barcode_packet LIKE :search", search: key])
    else
      all
    end
  end

end
