30.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  uid = Faker::Number.number(10)
  User.create!(
    email: email,
    password: password,
    password_confirmation: password,
    name: name,
    uid: uid
)
end
