Warbands Online
===============
Warbands Online is an online in-browser game where you take on the role of a 
commander of a warband consisting of about 5 other warriors. The player controls
 the warband navigation and actions in a medieval fantasy world. The warband 
will be able to fight different creatures or other warbands and complete quests 
in order to conquer the world. The warband gains experience, money and items as 
they pillage their way on the path chosen by the player.

Links
-----
+ Check out the source at [github](https://github.com/FreddieBoi/Warbands "Warbands at github")
+ Check out the very latest live version at [heroku](http://warbands.heroku.com/ "Warbands at heroku")

Testing
-------
Make sure all the requirements (**rspec** etc.) are met before continuing through:

    bundle install

Prepare the test database:

    rake db:test:prepare

You can run all the tests manually at any time:

    bundle exec rspec spec/

You can also test continuously using **autotest**.

Install the **autotest** gem:

    gem install autotest

Start testing:

    autotest

*Note: You may want to dedicate another terminal to **autotest***

Documentation
-------------
Make sure all the requirements (**rdoc**, **annotate-models** etc.) are met before continuing through:

    bundle install

Build the documentation for the app:

    rake doc:app

Add comments containing the data model to all the model files:

    bundle exec annotate
