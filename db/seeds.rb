# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'Create WORLD TEMPLATES'
starting_world = WorldTemplate.create! :name => "Starting world"
puts 'New template: ' << starting_world.name

puts 'Create REGION TEMPLATES'
region_template00 = RegionTemplate.create! :name => 'Woods', :desc => 'Trees everywhere!', :pos_x => 0, :pos_y => 0, :world_template => starting_world
puts 'New template: ' << region_template00.name
region_template01 = RegionTemplate.create! :name => 'Mountains', :desc => 'Rocks and boulders', :pos_x => 0, :pos_y => 1, :world_template => starting_world
puts 'New template: ' << region_template01.name
region_template10 = RegionTemplate.create! :name => 'Seaside', :desc => 'A port where ships sometimes arrive', :pos_x => 1, :pos_y => 0, :world_template => starting_world
puts 'New template: ' << region_template10.name
region_template02 = RegionTemplate.create! :name => 'Steppes of War', :desc => 'It is rather plain here...', :pos_x => 0, :pos_y => 2, :world_template => starting_world
puts 'New template: ' << region_template02.name

region_template20 = RegionTemplate.create! :name => 'Northern Island', :desc => 'Sandy dunes and beaches', :pos_x => 2, :pos_y => 0, :world_template => starting_world
puts 'New template: ' << region_template20.name
region_template21 = RegionTemplate.create! :name => 'Forest', :desc => 'Between the river and the steppes', :pos_x => 2, :pos_y => 1, :world_template => starting_world
puts 'New template: ' << region_template21.name
region_template11 = RegionTemplate.create! :name => 'The hills', :desc => 'A cliff in the forest', :pos_x => 1, :pos_y => 1, :world_template => starting_world
puts 'New template: ' << region_template11.name
region_template12 = RegionTemplate.create! :name => 'Dark forest', :desc => 'Deep woods surrounds you', :pos_x => 1, :pos_y => 2, :world_template => starting_world
puts 'New template: ' << region_template12.name
region_template22 = RegionTemplate.create! :name => 'Outer forest', :desc => 'The trees are traded for sand', :pos_x => 2, :pos_y => 2, :world_template => starting_world
puts 'New template: ' << region_template22.name

region_template30 = RegionTemplate.create! :name => 'River delta', :desc => 'Between the rivers and the sea', :pos_x => 3, :pos_y => 0, :world_template => starting_world
puts 'New template: ' << region_template30.name
region_template31 = RegionTemplate.create! :name => 'Oasis', :desc => 'An isolated area of vegetation in the desert', :pos_x => 3, :pos_y => 1, :world_template => starting_world
puts 'New template: ' << region_template31.name
region_template32 = RegionTemplate.create! :name => 'Rivers crossing', :desc => 'Knee deep waters and riverbanks', :pos_x => 3, :pos_y => 2, :world_template => starting_world
puts 'New template: ' << region_template32.name
region_template33 = RegionTemplate.create! :name => 'Some region', :desc => 'Guess you could do stuff here', :pos_x => 3, :pos_y => 3, :world_template => starting_world
puts 'New template: ' << region_template33.name
region_template23 = RegionTemplate.create! :name => 'River town', :desc => 'A city has grown around the river', :pos_x => 2, :pos_y => 3, :world_template => starting_world
puts 'New template: ' << region_template23.name
region_template13 = RegionTemplate.create! :name => 'Desert steppes', :desc => 'Plain desert steppes', :pos_x => 1, :pos_y => 3, :world_template => starting_world
puts 'New template: ' << region_template13.name
region_template03 = RegionTemplate.create! :name => 'Western forest', :desc => 'The entrance of a huge forest in the west', :pos_x => 0, :pos_y => 3, :world_template => starting_world
puts 'New template: ' << region_template03.name

region_template40 = RegionTemplate.create! :name => 'Harbor Town', :desc => 'A huge harbor town', :pos_x => 4, :pos_y => 0, :world_template => starting_world
puts 'New template: ' << region_template40.name
region_template41 = RegionTemplate.create! :name => 'Eastern steppes', :desc => 'The beginning of a wide steppland to the east', :pos_x => 4, :pos_y => 1, :world_template => starting_world
puts 'New template: ' << region_template41.name
region_template42 = RegionTemplate.create! :name => 'Shimmering woods', :desc => 'The shimmering woods', :pos_x => 4, :pos_y => 2, :world_template => starting_world
puts 'New template: ' << region_template42.name
region_template43 = RegionTemplate.create! :name => 'Mountain woods', :desc => 'Gigantic rocks and trees', :pos_x => 4, :pos_y => 3, :world_template => starting_world
puts 'New template: ' << region_template43.name
region_template44 = RegionTemplate.create! :name => 'The passage', :desc => 'A passage to the south east', :pos_x => 4, :pos_y => 4, :world_template => starting_world
puts 'New template: ' << region_template44.name
region_template34 = RegionTemplate.create! :name => 'Wide desert', :desc => 'Wide desert belonging to the sand people', :pos_x => 3, :pos_y => 4, :world_template => starting_world
puts 'New template: ' << region_template34.name
region_template24 = RegionTemplate.create! :name => 'Western desert', :desc => 'The western desert land', :pos_x => 2, :pos_y => 4, :world_template => starting_world
puts 'New template: ' << region_template24.name
region_template14 = RegionTemplate.create! :name => 'River', :desc => 'The river', :pos_x => 1, :pos_y => 4, :world_template => starting_world
puts 'New template: ' << region_template14.name
region_template04 = RegionTemplate.create! :name => 'Valley', :desc => 'A valley', :pos_x => 0, :pos_y => 4, :world_template => starting_world
puts 'New template: ' << region_template04.name

puts 'Create ENEMY TEMPLATES'
bandit_template = EnemyTemplate.create! :name => "Bandit", :desc => "A nasty bandit." ,:region_template => region_template11, :combat_value => 7
puts 'New template: ' << bandit_template.name
poacher_template = EnemyTemplate.create! :name => "Poacher", :desc => "A nasty poacher." ,:region_template => region_template10, :combat_value => 5
puts 'New template: ' << poacher_template.name
sand_archer_template = EnemyTemplate.create! :name => "Sand Archer", :desc => "An archer of the sand people." ,:region_template => region_template34, :combat_value => 7
puts 'New template: ' << sand_archer_template.name
troll_template = EnemyTemplate.create! :name => "Troll", :desc => "An ugly troll." ,:region_template => region_template13, :combat_value => 7
puts 'New template: ' << troll_template.name
thief_template = EnemyTemplate.create! :name => "Thief", :desc => "A simple thief." ,:region_template => region_template23, :combat_value => 8
puts 'New template: ' << thief_template.name

puts 'Create ITEM TEMPLATES'
sword_template = ItemTemplate.create! :name => 'Sword', :desc => 'A mighty sword.', :combat_value => 3, :world_template => starting_world
puts 'New template: ' << sword_template.name
dagger_template = ItemTemplate.create! :name => 'Dagger', :desc => 'A dagger.', :combat_value => 3, :world_template => starting_world
puts 'New template: ' << dagger_template.name
spear_template = ItemTemplate.create! :name => 'Spear', :desc => 'A long spear.', :combat_value => 5, :enemy_template => bandit_template
puts 'New template: ' << spear_template.name
bow_template = ItemTemplate.create! :name => 'Bow', :desc => 'A fine bow.', :combat_value => 6, :enemy_template => poacher_template
puts 'New template: ' << bow_template.name
superior_bow_template = ItemTemplate.create! :name => 'Superior Bow', :desc => 'A superior bow.', :combat_value => 10, :enemy_template => sand_archer_template
puts 'New template: ' << superior_bow_template.name
knife_template = ItemTemplate.create! :name => 'Knife', :desc => 'A simple knife.', :combat_value => 3, :enemy_template => thief_template
puts 'New template: ' << knife_template.name
axe_template = ItemTemplate.create! :name => 'Axe', :desc => 'An axe.', :combat_value => 3, :enemy_template => troll_template
puts 'New template: ' << axe_template.name

puts 'Create ACHIEVEMENTS'
a1 = Achievement.create! :name => "Created an own warband", :desc => "Created a very own warband and earned some reputation. Good luck!", :reputation => 10
puts 'New achievement: ' << a1.name
a2 = Achievement.create! :name => "Blood lust", :desc => "Killed the first enemy.", :reputation => 10
puts 'New achievement: ' << a2.name
a3 = Achievement.create! :name => "Sandy killer", :desc => "Killed "+sand_archer_template.name+" in "+sand_archer_template.region_template.name+".", :reputation => 30
puts 'New achievement: ' << a3.name

# puts 'SETTING UP EXAMPLE USERS'
# freddie = User.create :name => 'freddieboi', :email => 'freddieboi@gmail.com', :rpx_identifier => 'https://www.google.com/profiles/112693975111415891225' #, :password => 'asdfasdf', :password_confirmation => 'asdfasdf'
# freddie.admin = true
# freddie.save(false)
# puts 'New user created: ' << freddie.name
# dt = User.create! :name => 'DT', :email => 'dt@nospam.com', :password => 'please', :password_confirmation => 'please'
# dt.admin = true
# dt.save!
# puts 'New user created: ' << dt.name
# test_user = User.create! :name => 'TestUser', :email => 'test@testing.com', :password => 'asdfasdf', :password_confirmation => 'asdfasdf'
# puts 'New user created: ' << test_user.name

# puts 'SETTING UP EXAMPLE WORLDS'
# dts_world = World.create! :world_template => starting_world, :user => dt
# puts 'New world created for user: ' << test_user.name

# puts 'SETTING UP EXAMPLE REGIONS'
# region00 = Region.create! :region_template => region_template00, :world => dts_world
# puts 'New region created: ' << region00.name
# region01 = Region.create! :region_template => region_template01, :world => dts_world
# puts 'New region created: ' << region01.name
# region10 = Region.create! :region_template => region_template10, :world => dts_world
# puts 'New region created: ' << region10.name
# region11 = Region.create! :region_template => region_template11, :world => dts_world
# puts 'New region created: ' << region11.name

# puts 'SETTING UP EXAMPLE WARBANDS'
# warband = Warband.create! :name => 'The punkrockers', :reputation => 1337, :region => freddie.world.regions.first, :world => freddie.world
# puts 'New warband created: ' << warband.name

# warband = Warband.create! :name => 'DTs Dark Templars', :reputation => 1000, :region => dt.world.regions.first, :world => dt.world

# puts 'SETTING UP EXAMPLE MEMBERS'
# darktemplar = Member.create! :name => 'Dark Templar', :warband => warband
# puts 'New member created: ' << darktemplar.name
# hightemplar = Member.create! :name => 'High Templar', :warband => warband
# puts 'New member created: ' << hightemplar.name

# puts 'Create ENEMIES'
# bandit = Enemy.create! :enemy_template => bandit_template
# puts 'New enemy created: ' << bandit.name

# puts 'SETTING UP EXAMPLE ITEMS'
# sword = Item.create! :item_template => sword_template, :member => darktemplar
# puts 'New item created: ' << sword.name

# puts 'SETTING UP EXAMPLE NEWS'
# news1 = News.create! :title => "Welcome to Warbands Online", :user => freddie, :content => "Warbands Online is an online in-browser game where you take on the role of a commander of a warband consisting of about 5 other warriors. The player controls the warband navigation and actions in a medieval fantasy world. The warband will be able to fight different creatures or other warbands and complete quests in order to conquer the world. The warband gains experience, money and items as they pillage their way on the path chosen by the player."
# puts 'New news created: ' << news1.title
# news2 = News.create! :title => "Patch coming soon", :user => dt, :content => "Warbands Online is about to get patched very soon... Hang in there!"
# puts 'New news created: ' << news2.title
# news3 = News.create! :title => "Patch 1.3.3.7 released!", :user => freddie, :content => "Major content patch is hitting Warbands Online today. Enjoy!"
# puts 'New news created: ' << news3.title