class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_client

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

  private

  def set_client
    @client = Client.find_by_id(params[:id])
  end

end
