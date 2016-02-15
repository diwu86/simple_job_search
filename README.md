Simple Job Search

This application is for a simple job search

system requirements:
* Ruby version
2.3

* System dependencies

* Configuration

* Database creation
bundle exec rake db:migrate

* Database initialization

* How to run the test suite
bundle exec rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
for heroku deployment, please check heroku/master branch

Next steps:
* Move simple search call(currently using SimpleSearch model) to a search client and make it configurable.
* Move buttons, links inside base_style
* Make this search as a gem instead of an app. This way, different countries can just include this gem in their host app
 and use their own I18n locale and style.
* Check autocomplete gem for location
* Find or create a pagination gem that does not use ActiveRecord(Current pagination does not look good)