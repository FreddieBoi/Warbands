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
puts 'SETTING UP EXAMPLE REGIONS'
region00 = Region.create! :name => 'Da woods', :desc => 'Trees.... Everywhere!', :pos_x => 0, :pos_y => 0
puts 'New region created: ' << region00.name
region01 = Region.create! :name => 'Mountains', :desc => 'rocks and boulders', :pos_x => 0, :pos_y => 1
puts 'New region created: ' << region01.name
region10 = Region.create! :name => 'Riverside', :desc => 'Holy diver?!', :pos_x => 1, :pos_y => 0
puts 'New region created: ' << region10.name
region11 = Region.create! :name => 'Steppes of War', :desc => 'It is rather plain here...', :pos_x => 1, :pos_y => 1
puts 'New region created: ' << region11.name
puts 'SETTING UP EXAMPLE WARBANDS'
warband = Warband.create! :name => 'DTs Dark Templars', :reputation => 1000, :region => region00, :user => dt
puts 'New warband created: ' << warband.name
darktemplar = Member.create! :name => 'Dark Templar', :warband => warband
puts 'SETTING UP EXAMPLE MEMBERS'
puts 'New member created: ' << darktemplar.name
hightemplar = Member.create! :name => 'High Templar', :warband => warband
puts 'New member created: ' << hightemplar.name
puts 'SETTING UP EXAMPLE ENEMIES'
bandit = Enemy.create! :name => "Bandit", :desc => "A nasty bandit." ,:region => region11
puts 'New member created: ' << bandit.name
puts 'SETTING UP EXAMPLE ITEMS'
sword = Item.create! :name => 'Sword', :desc => 'A mighty sword.', :member => darktemplar
puts 'New item created: ' << sword.name
spear = Item.create! :name => 'Spear', :desc => 'A long spear.', :enemy => bandit
puts 'New item created: ' << spear.name
puts 'SETTING UP EXAMPLE NEWS'
news1 = News.create! :title => "Welcome to Warbands Online", :user => freddie, :content => "Warbands Online is an online in-browser game where you take on the role of a commander of a warband consisting of about 5 other warriors. The player controls the warband navigation and actions in a medieval fantasy world. The warband will be able to fight different creatures or other warbands and complete quests in order to conquer the world. The warband gains experience, money and items as they pillage their way on the path chosen by the player."
puts 'New news created: ' << news1.title
news2 = News.create! :title => "Patch coming soon", :user => dt, :content => "Warbands Online is about to get patched very soon... Hang in there!"
puts 'New news created: ' << news2.title
news3 = News.create! :title => "Patch 1.3.3.7 released!", :user => freddie, :content => "Major content patch is hitting Warbands Online today. Enjoy!"
puts 'New news created: ' << news3.title
