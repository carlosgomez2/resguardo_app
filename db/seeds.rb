Package.destroy_all
Client.destroy_all
User.destroy_all

user = User.create(
		email: "carlos@gmail.com",
		password: "password",
		password_confirmation: "password"
	)

puts "#{User.count} Users created."
puts "user: carlos@gmail.com"
puts "password: password"

5.times do
	Client.create(
		first_name: Faker::Name.first_name,
		second_name: Faker::Name.middle_name,
		last_name: Faker::Name.last_name,
		second_last_name: Faker::Name.last_name,
		principal_phone: Faker::PhoneNumber.phone_number,
		cellphone: Faker::PhoneNumber.cell_phone,
		email: Faker::Internet.email,
		birth: Faker::Date.birthday(18, 75),
		address: Faker::Address.street_address,
		postal_code: Faker::Address.zip_code,
		city: Faker::Address.city,
		state: Faker::Address.state,
		emergency_contact_full_name: Faker::FunnyName.name_with_initial ,
		emergency_contact_address: Faker::Address.street_address,
		emergency_contact_phone: Faker::PhoneNumber.cell_phone
	) 
end

puts "#{Client.count} client created."

clients = Client.all

client_ids = []

clients.each do |client|
	client_ids << client.id
end

12.times do
	Package.create(
		package_dimentions: "standard",
		package_weight: "#{(0..100)} kg.",
		safeguard_time: Time.now + 15.years,
		outbound_packet_time: Faker::Time.between(2.days.ago, Date.today, :all),
		entry_packet_time: Faker::Time.between(2.days.ago, Date.today, :all),
		batch_number: Faker::IDNumber.valid,
		client_id: client_ids.sample
	)
end

puts "#{Package.count} packages created."