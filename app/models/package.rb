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

  def barcode_generator
    require 'securerandom'
    require 'barby'
    require 'barby/barcode/code_128'
    require 'barby/outputter/png_outputter'

    randomize = SecureRandom.hex(16)
    barcode_128 = randomize.to_s.downcase
    c = Client.find_by_id(params[:id])
    client = c.first_name + "_" + c.last_name + "_" + c.second_last_name
    path = "barcodes/code_#{client}.png"

    barcode = Barby::Code128B.new(barcode_128)
    # Set to BINARY because it can't convert assci 8 bit to a utf-8 8 bit image, so, convert: binary => base64 => utf-8
      File.open(path, 'w:BINARY'){ |f|
        f.write barcode.to_png(:height => 40, :margin => 5)
      }
  end

end
