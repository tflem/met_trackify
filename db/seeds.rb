# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless User.exists?(email: "admin@mettrackify.com")
  User.create!(email: "admin@mettrackify.com", password: "password", admin: true)
end

unless User.exists?(email: "viewer@mettrackify.com")
  User.create!(email: "viewer@mettrackify.com", password: "password")
end

[11111, 22222].each do |number|
  unless Project.exists?(project_number: number)
    Project.create!(project_number: number,
      project_name: "Sample Project about #{number}",
      project_time: "5 Hours")
  end
end

current_date = DateTime.now

["Christmas Tree", "Flushmount Lighting Six Pack"].each do |name|
  unless Product.exists?(article_name: name)
    Product.create!(article_name: name,
      article_number: 1000798622,
      date_received: current_date,
      article_location: "15-023")
  end
end
