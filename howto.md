# CLIENT
  rails g scaffold client first_name:string second_name:string last_name:string second_last_name:string principal_phone:string cellphone:string email:string birth:date address:string postal_code:string city:string state:string emergency_contact_full_name:string emergency_contact_address:string emergency_contact_phone:string  

# PACKAGE
  rails g scaffold package package_dimentions:string package_weight:string safeguard_time:string outbound_packet_time:string entry_packet_time:string batch_number:string client:references
