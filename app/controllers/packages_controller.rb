class PackagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  before_action :set_client

  # respond_to :html

  # GET /packages
  # GET /packages.json
  def index
    # Render packages from Client with a function to paginate in descendence order and display 6 Clients per page, also include "search" function to search into Packages model
    @packages = @client.packages.search(params[:search]).paginate(page: params[:page], per_page: 6).order('created_at DESC')
    # logger.debug "packages variable = #{@packages}"
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        # Stablish the Client
        set_client
        # Generate new package object with current package and current client
        pdf = PackagePdf.new(@package, set_client)
        # Store client name in a variable called "client"
        client = set_client.first_name + "_" + set_client.last_name + "_" + set_client.second_last_name
        # Render PDF data with the name of current Client with disposition inline to display in web browser
        send_data pdf.render, filename: "Detalle_#{client}.pdf", disposition: 'inline'
      end
    end
  end

  # GET /packages/new
  def new
    @package = @client.packages.new
    # Set barcode packet == to barcode_128
    @package.barcode_packet = random_code
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = @client.packages.new(package_params)
    respond_to do |format|
      if @package.save
        # Call method to generate a barcode only if package is saved
        barcode_generator
        # Respond notice
        format.html { redirect_to client_package_path(:id => @package), notice: 'Paquete creado correctamente.' }
        # format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        # format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to client_package_path(:id => @package), notice: 'Paquete actualizado correctamente.' }
        # format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        # format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    redirect_to client_packages_url
    flash[:notice] = "Paquete eliminado correctamente."
    # respond_to do |format|
    #   format.html { redirect_to client_packages_url(:client_id => client), notice: 'Package was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    def set_client
      @client = Client.find_by_id(params[:client_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:reception_method, :reception_guide, :shipping_method, :shipping_guide, :entry_packet, :outbound_packet, :package_dimentions, :package_weight, :delivered_package, :safeguard_time, :batch_number, :barcode_packet, :client_id)
    end

    def search_params
      params.require(:search).permit(:package_dimentions, :package_weight, :safeguard_time, :outbound_packet_time, :entry_packet_time, :batch_number)
    end
end
