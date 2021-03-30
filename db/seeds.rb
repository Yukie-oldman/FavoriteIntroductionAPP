# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              
99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

puts "Users Created"

admin_user = User.first
guest_user = User.find(2)
guest2_user = User.find(3)

50.times do |n|
  account_name = "出納#{n + 1}"
  description = "出納詳細#{n + 1}"
  admin_user.accounts.create!(summary: account_name, description: description, price: 1000, category: "雑費", cashed_on: Time.current)
  guest_user.accounts.create!(summary: account_name, description: description, price: 1000, category: "雑費", cashed_on: Time.current)
  guest2_user.accounts.create!(summary: account_name, description: description, price: 1000, category: "雑費", cashed_on: Time.current)
end

puts "Tasks Created"
