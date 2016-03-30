class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_client
  before_action :set_package

  # Function to make Secure Random hexadecimal 16 digit codes
  def random_code
    require 'securerandom'
    # Generate a secure random code
    randomize = SecureRandom.hex(16)
    # Store code generated on barcode_128 in string format
    @barcode_128 = randomize.to_s.downcase
  end

  # Function to generate a PNG barcode and store into /barcodes/ folder
  def barcode_generator
    require 'barby'
    require 'barby/barcode/code_128'
    require 'barby/outputter/png_outputter'

    code = @package.barcode_packet
    # Set a path to store png
    path = "barcodes/#{code}.png"


    # Create a barcode with secure barcode_128
    barcode = Barby::Code128B.new(code)
    # Set to BINARY because it can't convert assci 8 bit to a utf-8 8 bit image, so, convert: binary => base64 => utf-8
    # Save in path directory
      File.open(path, 'w:BINARY'){ |f|
        f.write barcode.to_png(:height => 40, :margin => 5)
      }
  end

  private

  # Private method to retrieve current client and pass between controllers
  def set_client
    c = Client.find_by_id(params[:id])
  end

  def set_package
    @package = Package.all
  end

end
