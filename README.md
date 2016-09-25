# README
# Library Room Booking System


The library booking service allows users to explore available rooms and book as per their convenience. The admins have a separate Login portal from where they can control the application system.

The application was developed using Ruby 2.2.0, Rails 5 and ActiveAdmin Gem. The deployed application is on Heroku https://library-booking-system-rails.herokuapp.com/

DB Details
Development - SQLite:
Production -  PostgreSQL (SQLlite can't be used on Heroku)

To Deploy the application on Heroku please follow these steps
http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku

A cron job (Heroku Schedular) runs on Heroku to delete expired rooms. A cron job using 'Whenever' Gem is also available (schedular.rb) to run the task on local or EC2.
Start a cron task on Heroku Schedular by using the command #'rake raketasks:deleteOldRecords'

NOTE: Few features of ADMIN are still in progress, fell free to explore as a User.


