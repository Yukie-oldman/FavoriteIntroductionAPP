# coding: utf-8
require "csv"

User.create!( 
  name: "サンプルくん",
  email: "first@email.com",
  password: "password",
  password_confirmation: "password",
  admin: true)
              
User.create!(
  name: "二人目さん",
  email: "seconf@email.com",
  password: "password",
  password_confirmation: "password")

  10.times do |n|
    name  = Faker::Ancient.god + Faker::Name.last_name
    email = "sample-#{n+1}@email.com"
    password = "password"
    User.create!(
      name: name,
      email: email,
      password: password,
      password_confirmation: password)               
  end

puts ('created users')

CSV.foreach('db/introduction.csv') do |record|
  Introduction.create(
    :user_id => record[0],
    :name => record[1],
    :caption => record[2],
    :buf_tags => record[3],
    :contents => record[4].gsub("\\r\\n","\r\n"))
end

puts ('created introductions')

Introduction.all.each { |introduction| introduction.create_tags }

puts ('created tags')