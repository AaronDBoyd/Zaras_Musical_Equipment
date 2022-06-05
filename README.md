# Zara's Musical Equipment

#### By Aaron Boyd

This application manages a fictional store's inventory (products), and allows users to leave reviews and rate products.

## Technologies used:

* Ruby 
* Rails 
* RSPEC
* Capybara
* shoulda-matchers
* Pry
* markdown
* Postgres
* SQL


## Description:
This application uses Ruby on Rails and Postgres to demonstrate the a one-to-many association between object classes. It also uses Routes, Models and Controllers to add CRUD functionality.

In this example we use Products(One) and Reviews(Many). Each Product has the attributes name:, cost: and origin:. A product can be created, updated and destroyed. Each Review belongs to a Product and has the attributes of author:, content:, rating: and product_id:(foreign_key). A review can also be created, updated and destroyed. Since a Review belongs to a Product, it will be destroyed if the product it belongs to is destroyed.

## Setup/Installation Requirements

* To run this program, you must have Ruby 2.6.5 and Rails 5.2.0 installed on your machine. If you do not, you can follow these instructions: [Mac](https://www.learnhowtoprogram.com/ruby-and-rails-part-time/getting-started-with-ruby/installing-ruby-on-mac) or [PC](https://www.learnhowtoprogram.com/ruby-and-rails-part-time/getting-started-with-ruby/installing-ruby-on-windows).

* Clone this file to your local machine using this projects' [github](https://github.com/AaronDBoyd/Zaras_Musical_Equipment)
* Once you have the project downloaded, navigate to the root of the project in your terminal and type "bundle install".
* You will also need Postgres installed on your machine. If you do not, you can follow these [instructions.](https://www.learnhowtoprogram.com/ruby-and-rails-part-time/getting-started-with-ruby/installing-postgres).
* In the terminal at the root of the project, type "postgres" to make sure Postgres is running.
* NOTE: if you are running this application on a Windows machine you will have to adjust the database access settings. To do so, go to the file located at `config/database.yml` and add you username and password specifications to sections `development:`, `test:`, and `production:` like so:
```
development:
  <<: *default
database: Zaras_musical_equipment_development
username: <%= ENV['POSTGRES_USERNAME'] %> 
password: <%= ENV['POSTGRES_PASSWORD'] %> 
```

* Then, in a separate terminal type:
* `rake db:create` - this will create a new database.
* `rake db:migrate` - this will upload the schema design to the database.
* `rake db:test:prepare` - this will design the test database to mirror the development database.
* `rake db:seed` - this with auto-populate the database.
* `rails s` - this will run the rails server so the project can be viewed in the browser.(keep this terminal separate from your working terminal.)
* In a browswer, visit `localhost:3000` to view the webpage.

## Known Bugs

* No known bugs.
* If you notice any mistakes or bugs, please email a.boyd91@yahoo.com

## License

[MIT](https://opensource.org/licenses/MIT)
Copyright 2022 (c) Aaron Boyd 
