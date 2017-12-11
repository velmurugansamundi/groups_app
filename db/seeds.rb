# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ROLES = ["Director","Assistant Director","Members"]

ROLES.each do |role|
  Role.find_or_create_by(name: role)
end

USERS = [
    {:name=>"velmurugan",:email=>"velmurugan@pitsolutions.com",:gender=>"male"},{:name=>"pradeep",:email=>"pradeep@pitsolutions.com",:gender=>"male"},
    {:name=>"kumar",:email=>"kumar@pitsolutions.com",:gender=>"male"},{:name=>"senthil",:email=>"senthil@pitsolutions.com",:gender=>"male"},
    {:name=>"jakay",:email=>"jakay@pitsolutions.com",:gender=>"male"},{:name=>"chandru",:email=>"chandru@pitsolutions.com",:gender=>"male"},
    {:name=>"anand",:email=>"anand@pitsolutions.com",:gender=>"male"},{:name=>"sekar",:email=>"sekar@pitsolutions.com",:gender=>"male"},
    {:name=>"ranjith",:email=>"ranjith@pitsolutions.com",:gender=>"male"},{:name=>"samundi",:email=>"samundi@pitsolutions.com",:gender=>"male"},
    {:name=>"krishnan",:email=>"krishnan@pitsolutions.com",:gender=>"male"},{:name=>"mani",:email=>"mani@pitsolutions.com",:gender=>"male"},
    {:name=>"prakash",:email=>"prakash@pitsolutions.com",:gender=>"male"},{:name=>"suriya",:email=>"suriya@pitsolutions.com",:gender=>"male"},
    {:name=>"jayasuriya",:email=>"jayasuriya@pitsolutions.com",:gender=>"male"},{:name=>"anbarasan",:email=>"anbarasan@pitsolutions.com",:gender=>"male"},
    {:name=>"elumalai",:email=>"elumalai@pitsolutions.com",:gender=>"male"},{:name=>"palanivel",:email=>"palanivel@pitsolutions.com",:gender=>"male"},
    {:name=>"mari",:email=>"mari@pitsolutions.com",:gender=>"male"},{:name=>"maniyarasan",:email=>"maniyarasan@pitsolutions.com",:gender=>"male"},
]

USERS.each do |user|
  User.find_or_create_by(name: user[:name],email: user[:email],gender: user[:gender])
end


