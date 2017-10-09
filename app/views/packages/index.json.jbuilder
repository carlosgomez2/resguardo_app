json.array!(@packages) do |package|
  json.extract! package, :id, :package_dimentions, :package_weight, :safeguard_time, :outbound_packet_time, :entry_packet_time, :batch_number, :client_id
  json.url package_url(package, format: :json)
end
