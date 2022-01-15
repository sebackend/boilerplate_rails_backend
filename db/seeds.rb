100.times do
  User.create(
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: Faker::Number.number(digits: 10).to_s
  )
end
