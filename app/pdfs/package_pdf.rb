class PackagePdf < Prawn::Document

	def initialize(package, c)
		super(top_margin: 35, :page_size => "A4")
		# Variables
    @package = package
    @client = c
		# PDF Content Structure
		header_package
		content_package
		footer_package
	end

	def data_client
		# Data from client
		row_1_col_1 = make_cell(:content => "Fecha de ingreso:")
		row_2_col_1 = make_cell(:content => "Nombre del cliente:")
		row_3_col_1 = make_cell(:content => "Dirección:")
		row_4_col_1 = make_cell(:content => "Teléfono:")
		row_5_col_1 = make_cell(:content => "Email:")
		row_6_col_1 = make_cell(:content => "Contacto de emergencia:")

		row_1_col_2 = make_cell(:content => "#{@package.created_at}", :align => :center)
		row_2_col_2 = make_cell(:content => "#{@client.first_name.capitalize} #{@client.second_name.capitalize} #{@client.last_name.capitalize} #{@client.second_last_name.capitalize}", :align => :center)
		row_3_col_2 = make_cell(:content => "#{@client.address.capitalize}, C.P. #{@client.postal_code}", :align => :center)
		row_4_col_2 = make_cell(:content => "#{@client.principal_phone}", :align => :center)
		row_5_col_2 = make_cell(:content => "#{@client.email}", :align => :center)
		row_6_col_2 = make_cell(:content => "#{@client.emergency_contact_full_name}", :align => :center)

		table([ [ row_1_col_1 , row_1_col_2 ],
						[ row_2_col_1 , row_2_col_2 ],
						[ row_3_col_1 , row_3_col_2 ],
						[ row_4_col_1 , row_4_col_2 ],
						[ row_5_col_1 , row_5_col_2 ],
						[	row_6_col_1 , row_6_col_2 ], ], :position => :center, :width => 425, :cell_style => { :border_width => 0 })
	end

	def data_package
		# Data from package
      row_1_col_1 = make_cell(:content => "Dimensiones del paquete:")
      row_2_col_1 = make_cell(:content => "Peso del paquete:")
      row_3_col_1 = make_cell(:content => "Tiempo de resguardo contratado:")
      row_4_col_1 = make_cell(:content => "Fecha de entrada del paquete:")
      row_5_col_1 = make_cell(:content => "Fecha de salida del paquete:")
      row_6_col_1 = make_cell(:content => "Número de lote:")

      row_1_col_2 = make_cell(:content => "#{@package.package_dimentions} cm.", :align => :center)
      row_2_col_2 = make_cell(:content => "#{@package.package_weight} gramos.", :align => :center)
      row_3_col_2 = make_cell(:content => "#{@package.safeguard_time}", :align => :center)
      row_4_col_2 = make_cell(:content => "#{@package.entry_packet}", :align => :center)
      row_5_col_2 = make_cell(:content => "#{@package.outbound_packet}", :align => :center)
      row_6_col_2 = make_cell(:content => "#{@package.batch_number}", :align => :center)

      table([ [ row_1_col_1 , row_1_col_2 ],
              [ row_2_col_1 , row_2_col_2 ],
              [ row_3_col_1 , row_3_col_2 ],
              [ row_4_col_1 , row_4_col_2 ],
              [ row_5_col_1 , row_5_col_2 ],
              [ row_6_col_1 , row_6_col_2 ], ], :position => :center, :width => 425, :row_colors => ["E6E9ED", "F5F7FA"], :cell_style => {:border_color => "E6E9ED"})
	end

	def header_package
		font_size(20) do
			text "DOSSIER", :align => :center, :style => :bold
			move_down 5
		end
		text "Comprobante de resguardo de documentos", :align => :center, :styles => [:italic], :color => 'AAB2BD'
		move_down 20
		transparent(0.1) { stroke_horizontal_rule }
		move_down 10

		# Data client
		data_client

		move_down 10
		transparent(0.1) { stroke_horizontal_rule }
		move_down 20
	end

	def content_package
    font_size(15) do
			text "DETALLES DEL PAQUETE", :align => :center, :style => :bold
			move_down 20
		end

		# Data package
		data_package

		move_down 25

		# Barcode_128
		# path = @client.first_name + "_" + @client.last_name + "_" + @client.second_last_name
		path = @package.barcode_packet
		image "barcodes/#{path}.png", :position => :center

		move_down 240
	end

	def footer_package
		font_size(10) do
			transparent(0.1) { stroke_horizontal_rule }
			move_down 10
			text "Powered by Dossier", :align => :right, :color => 'AAB2BD', :style => :bold
		end
	end

end
