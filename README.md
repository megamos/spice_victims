## Spice-deaths Counter

**http://cryptic-spire-9877.herokuapp.com/**

**A site that counts the number of people killed or hospitalized in relation to the synthetic drug Spice.**

### Features

* *Death counter*
* *Hospitalized counter*
* *Login & Register* - (Users/Admins)
  * option to add first-,last-name and victim relation
* *Victims* - Name/Age/City/Country/Category(deceased, hospitalized, other)/Info/Picture/Comments/Link(info, newspaper)
  * commenting for every Victim#show
* *Links* - Category(news, research, video)
  * voteable
* *Disscusion* - framed to enlighten us all about the topic
* *Statistics page* (Showing year/country/deaths/hospitalized)

#### Things that needs to be done before launch

* Adding Discussion forum + Comments
* Fix js function for showing next/last of Latest victims
* Make the victims#show page
* Pictures and explanation of Spice
  * Maybe a "What is Spice?" link that shows a page with info.
* Better validations
* Final styling

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

To use the admin dashboard, create /config/local_env.yml file (you can use the sample file)
and add any admin name and password that will be used for admin authentication. In
production you have to set these environment variables manually. The /config/local_env.yml
file is ignored by git. In order to run dashboard tests successfully, environment variables
in local_env.yml have to be the same as the credentials in /spec/support/auth_helper.rb file.
