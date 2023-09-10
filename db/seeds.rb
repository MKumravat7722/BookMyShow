# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
    name: "Mohit",
    user_name: "Mohit@123",
    email: "cs19.mohitkumravat@svceindore.ac.in",
    password: "mohit123",
    type: "Owner"
  )

  User.create!(
    name: "sadique",
    user_name: "sadique@123",
    email: "sadique@gmail.com",
    password: "sadique123",
    type: "Customer"
  )


  theater1 = Theater.create!(
    name: "Ashtha",
    location: "patnipura",
    user_id: 1
  )


  screen1 = Screen.create!(
    screen_name: "first_screen_of_ashtha",
    capacity: 40,
    theater_id: 1
  )


  movie1 = Movie.create!(
    name: "RRR"
  )

 show1 = Show.create!(
    movie_id: 1,
    screen_id: 1
  )


  Ticket.create!(
   ticket_purchased: 2,
    user_id: 2,
    show_id: 1
  )
  #------------------------------------------------------------------------------------------------------------------------------------------

  User.create!(
    name: "akshat",
    user_name: "akshat@123",
    email: "akshat@gmail.com",
    password: "akshat123",
    type: "Customer"
  )

  User.create!(
    name: "ritik",
    user_name: "ritik@123",
    email: "ritik@gmail.com",
    password: "ritik123",
    type: "Owner"
  )

  User.create!(
    name: "bharat",
    user_name: "bharat@123",
    email: "bharat@gmail.com",
    password: "bharat123",
    type: "Customer"
  )

  theater1 = Theater.create!(
    name: "mangalcity",
    location: "radission",
    user_id: 4
  )


  screen1 = Screen.create!(
    screen_name: "Screen_1_of_mangalcity",
    capacity: 40,
    theater_id: 2
  )


  movie1 = Movie.create!(
    name: "gaddar 2 "
  )


  show1 = Show.create!(
    movie_id: 2,
    screen_id: 2
  )


  Ticket.create!(

    ticket_purchased: 4,
    user_id: 3,
    show_id: 2
  )
