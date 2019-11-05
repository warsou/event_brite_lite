# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '#############################'
puts '#   Starting seed process   #'
puts '#############################'

puts '',''
puts '#' * 40
puts 'Wiping database'

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  # deletes all tables in DB except for the schema one
  next if table == 'schema_migrations' || table == 'ar_internal_metadata'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
  ActiveRecord::Base.connection.reset_pk_sequence!(table)
end

puts '-' * 10 + 'Database wiped' + '- * 10'
puts ''

puts '#' * 40
puts 'Creating users'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'passwordpassword',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 2)
  )
end

puts '-' * 10 + 'Users created ' + '- * 10'
puts ''

puts '#' * 40
puts 'Creating events'

20.times do
  Event.create!(
    title: Faker::Lorem.sentence(word_count: 2),
    start_date: Time.now + rand(10000..50000),
    duration: rand(1..5) * 20,
    description: Faker::Lorem.sentence(word_count: 10),
    price: rand(3..90) * 10,
    location: Faker::Address.city,
    host_id: User.all.sample.id
  )
end

puts '-' * 10 + 'Events created' + '- * 10'
puts ''

puts '#' * 40
puts 'Creating attendances'
users_ids = User.all.ids
Event.all.each do |event|
  (users_ids - [event.host.id]).sample(rand(2..5)).each do |user_id|
    Attendance.create!(
      stripe_customer_id: Faker::Alphanumeric.unique.alpha(number: 10),
      attended_event_id: event.id,
      guest_id: user_id
    )
    end
end

puts '-' * 10 + 'Attendances created' + '- * 10'
puts '',''

puts '###################################'
puts '#   Seeding complete - no error   #'
puts '###################################'
puts '',''
