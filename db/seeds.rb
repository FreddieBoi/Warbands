# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'SETTING UP EXAMPLE USERS'
freddie = User.create! :name => 'Freddie', :email => 'freddieboi@gmail.com', :password => 'asdfasdf', :password_confirmation => 'asdfasdf'
freddie.admin = true
freddie.save!
puts 'New user created: ' << freddie.name
dt = User.create! :name => 'DT', :email => 'dt@nospam.com', :password => 'please', :password_confirmation => 'please'
dt.admin = true
dt.save!
puts 'New user created: ' << dt.name
test_user = User.create! :name => 'TestUser', :email => 'test@testing.com', :password => 'asdfasdf', :password_confirmation => 'asdfasdf'
puts 'New user created: ' << test_user.name
region00 = Region.create! :name => 'Da woods', :desc => 'Trees.... Everywhere!', :pos_x => 0, :pos_y => 0
puts 'New region created: ' << region00.name
region01 = Region.create! :name => 'Mountains', :desc => 'rocks and boulders', :pos_x => 0, :pos_y => 1
puts 'New region created: ' << region01.name
region10 = Region.create! :name => 'Riverside', :desc => 'Holy diver?!', :pos_x => 1, :pos_y => 0
puts 'New region created: ' << region10.name
region11 = Region.create! :name => 'Steppes of War', :desc => 'It is rather plain here...', :pos_x => 1, :pos_y => 1
puts 'New region created: ' << region11.name
warband = Warband.create! :name => 'DTs Dark Templars', :reputation => 1000, :region => region00, :user => dt
puts 'New warband created: ' << warband.name
