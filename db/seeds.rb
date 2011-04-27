# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'SETTING UP EXAMPLE USERS'
freddie = User.create! :name => 'Freddie', :email => 'freddieboi@gmail.com', :password => 'asdfasdf', :password_confirmation => 'asdfasdf'
puts 'New user created: ' << freddie.name
dt = User.create! :name => 'DT', :email => 'dt@nospam.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << dt.name
