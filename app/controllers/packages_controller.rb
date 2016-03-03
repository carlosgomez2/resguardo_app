class PackagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  before_action :set_client

  # respond_to :html

  # GET /packages
  # GET /packages.json
  def index
    @packages = @client.packages.search(params[:search]).paginate(page: params[:page], per_page: 6).order('created_at DESC')
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do

        barcode_generator
        # do_png

        c = Client.find_by_id(params[:id])
        pdf = PackagePdf.new(@package, c)
        client = c.first_name + "_" + c.last_name + "_" + c.second_last_name
        # client_name
        send_data pdf.render, filename: "Detalle_#{client}.pdf", disposition: 'inline'
      end
    end
  end

  # GET /packages/new
  def new
    @package = @client.packages.new
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
        format.html { redirect_to client_package_path(:id => @package), notice: 'Package was successfully created.' }
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
        format.html { redirect_to client_package_path(:id => @package), notice: 'Package was successfully updated.' }
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
      params.require(:package).permit(:package_dimentions, :package_weight, :safeguard_time, :outbound_packet_time, :entry_packet_time, :batch_number, :client_id)
    end

    def search_params
      params.require(:search).permit(:package_dimentions, :package_weight, :safeguard_time, :outbound_packet_time, :entry_packet_time, :batch_number)
    end
end
