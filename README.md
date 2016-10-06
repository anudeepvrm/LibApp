# README
# Library Room Booking System

NOTE for Reviewers:

DO NOT DELETE SUPER ADMIN. ADMIN CAN DELETE HIMSELF

Current Booked rooms and Booking history are two different entities. Active Booked rooms won't appear in booking history. The room will go to booking history only after the time expires, user cancels it or the admin deletes that room.
Admin can delete a room booked by a user (Special case). In that case, the User will no longer have the room under his active rooms but instead it will be cancelled and moved to his history.
A user can book a 2 hour slot but he can't book at any arbitrary time. For example, a user can book a slot at 1am-3am or 2am-4am. He is not allowed to book a room from 2:13am-4:13am. 
User can't book expired slots. For example, if the current time is 4:45am, the user can't book a room slot at 4:00 am. He/She is only allowed to book 5am slot.
User can only book rooms one week in advance.
After 2 hours, the booked room will be deleted from active rooms and moved to Booking history by a cron script.
User can have only one active booking, the book link will be disabled until he/she cancels the room, slot expires or the admin deletes the room
Admin can delete a room that is already booked by a user. It will be removed from active rooms section of the user and moved to booking history.

New features in latest release:

Admin can book on behalf of a user (based on userId) -> Under bookedrooms ->new bookedroom.

Admin can view Booking History of a room under rooms-> view-> history html.

Admin can view Booking History of a user under Users -> view -> history html (Remember booking a room does not mean it is in history. cancel a booking to test this functionality)

---------------------------------------------------------------------------------------------------------------------------------

The library booking service allows users to explore available rooms and book as per their convenience. The admins have a separate Login portal from where they can control the application system.

The application was developed using Ruby 2.2.0, Rails 5 and ActiveAdmin Gem. The deployed application is on Heroku https://library-booking-system-rails.herokuapp.com/

To Test the application on Heroku, create a new user account and use the existing Admin account available in 'seeds.rb'
username: admin@example.com, password: password

The rooms and email have validation for unique, so most of them are commented out to prevent error while initializing db. However the production db on Heroku has values initialized. 

DB Details =>
Development - SQLite:
Production -  PostgreSQL (SQLlite can't be used on Heroku)

To Deploy the application on Heroku please follow these steps
http://docs.railsbridge.org/intro-to-rails/deploying_to_heroku

A cron job (Heroku Schedular) runs on Heroku to delete expired rooms. A cron job using 'Whenever' Gem is also available (schedular.rb) to run the task on local or EC2.
Start a cron task on Heroku Schedular by using the command #'rake raketasks:deleteOldRecords'




NOTE: 


Next Release: More admin features to be added.

