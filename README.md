## Spice-deaths Counter

**http://cryptic-spire-9877.herokuapp.com/**

**A site that counts the number of people killed or hospitalized from the synthetic drug Spice.**

*As I'm just starting to learn Rails, I'd love some help getting this site up and out there asap.*

### Features

* Death counter
* Hospitalized counter
* Login & Register *(Users/Admins)*
  * option to add first-,last-name and victim relation
* *Victims:* Name/Age/City/Country/Comments/Link(info/newspaper)
  * commenting area for every Victim
* *Links:* Any kind of "learn more" information about the topic
  * voteable
* Disscusion - dedicated to "How can we stop it?"
* Statistics page (Showing year/country/deaths/hospitalized)

#### Things that needs to be done before launch

* Fix the header. (Styles, pics and maybe some more info)
* Add admin features to edit and remove links/victims
* Better validations
* Adding "order by vote" to links
* #Show page for every Victim with more info
* **Adding all the Victims**

##### Thoughts

Let's fuel the fire of today's debate about the dangers of the (somewhat) legal drug spice.
Many young people don't want to break the law. Instead of smoking cannabis they buy Spice.
I feel lucky not to be one of those that never woke up after.

##### Development & Deployment

You can populate your development database with random people and links using
'rake fake' command in your console. Behavior of this rake task can be changed through
/lib/tasks/fake.rake file.

Do not modify the annotations added as comments at the top of models, factories etc.
They should update automatically when you run rake db:migrate.

There is no overt user controller, so any changes to strong parameters for users have
to be made in /config/initializers/devise_permitted_parameters.rb.

The database configuration file /config/database.yml was removed from version control.
You can rename and use the database.yml.sample file locally or configure your own.
No file means that Heroku will create and configure the default database on its own.
