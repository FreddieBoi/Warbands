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
region = Region.create! :name => 'Da woods', :desc => 'Trees.... Everywhere!', :pos_x => 0, :pos_y => 0
puts 'New region created: ' << region.name
region2 = Region.create! :name => 'Mountains', :desc => 'rocks and boulders', :pos_x => 0, :pos_y => 1
puts 'New region created: ' << region2.name
warband = Warband.create! :name => 'DTs Dark Templars', :reputation => 1000, :region => region, :user => dt
puts 'New warband created: ' << warband.name
