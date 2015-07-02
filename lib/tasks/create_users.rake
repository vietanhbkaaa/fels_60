namespace :create_users do
  desc "TODO"
  task create_users: :environment do
    20.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
    end
  end
 end
