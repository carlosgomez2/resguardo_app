class PackagePdf < Prawn::Document

	def initialize(package, c)
		super(top_margin: 35, :page_size => "A4")
    @package = package
    @client = c
		header_package
		content_package
		footer_package
	end

	def header_package
		# Meter fuente personalizada
		font_size(20) do
			text "WAREHOUSE INC.", :align => :center
			move_down 5
		end
		text "Comprobante de resguardo de documentos", :align => :center, :styles => [:italic], :color => '757575'
		move_down 20
		transparent(0.6) { stroke_horizontal_rule }
		move_down 10
    # DATA CLIENT
    row_1_col_1 = make_cell(:content => "Cliente:")
    row_2_col_1 = make_cell(:content => "Dirección:")
    row_3_col_1 = make_cell(:content => "Teléfono:")
    row_4_col_1 = make_cell(:content => "Email:")
    row_5_col_1 = make_cell(:content => "Contacto de emergencia:")
    row_1_col_2 = make_cell(:content => "#{@client.first_name.capitalize} #{@client.second_name.capitalize} #{@client.last_name.capitalize} #{@client.second_last_name.capitalize}", :align => :center)
    row_2_col_2 = make_cell(:content => "#{@client.address.capitalize}, C.P. #{@client.postal_code}", :align => :center)
    row_3_col_2 = make_cell(:content => "#{@client.principal_phone}", :align => :center)
    row_4_col_2 = make_cell(:content => "#{@client.email}", :align => :center)
    row_5_col_2 = make_cell(:content => "#{@client.emergency_contact_full_name}", :align => :center)

    table([ [ row_1_col_1 , row_1_col_2 ],
            [ row_2_col_1 , row_2_col_2 ],
            [ row_3_col_1 , row_3_col_2 ],
            [ row_4_col_1 , row_4_col_2 ],
            [ row_5_col_1 , row_5_col_2 ], ], :position => :center, :width => 400, :cell_style => { :border_width => 0 })

		move_down 10
		transparent(0.6) { stroke_horizontal_rule }
		move_down 20
	end

	def content_package
    font_size(15) do
			text "DETALLES DEL PAQUETE", :align => :center
			move_down 20
		end
    # DATA PACKAGE
      row_1_col_1 = make_cell(:content => "Dimensiones del paquete:")
      row_2_col_1 = make_cell(:content => "Peso del paquete:")
      row_3_col_1 = make_cell(:content => "Tiempo de resguardo contratado:")
      row_4_col_1 = make_cell(:content => "Fecha de entrada del paquete:")
      row_5_col_1 = make_cell(:content => "Fecha de salida del paquete:")
      row_6_col_1 = make_cell(:content => "Número de lote:")

      row_1_col_2 = make_cell(:content => "#{@package.package_dimentions} cm.", :align => :center)
      row_2_col_2 = make_cell(:content => "#{@package.package_weight} gramos.", :align => :center)
      row_3_col_2 = make_cell(:content => "#{@package.safeguard_time}", :align => :center)
      row_4_col_2 = make_cell(:content => "#{@package.entry_packet_time}", :align => :center)
      row_5_col_2 = make_cell(:content => "#{@package.outbound_packet_time}", :align => :center)
      row_6_col_2 = make_cell(:content => "#{@package.batch_number}", :align => :center)

      table([ [ row_1_col_1 , row_1_col_2 ],
              [ row_2_col_1 , row_2_col_2 ],
              [ row_3_col_1 , row_3_col_2 ],
              [ row_4_col_1 , row_4_col_2 ],
              [ row_5_col_1 , row_5_col_2 ],
              [ row_6_col_1 , row_6_col_2 ], ], :position => :center, :width => 400)
		move_down 345
	end

	def footer_package
		font_size(10) do
			transparent(0.6) { stroke_horizontal_rule }
			move_down 10
			text "Made with <3 and powered by Warehouse Inc.", :align => :right, :color => 'bdbdbd'
		end
	end

end
