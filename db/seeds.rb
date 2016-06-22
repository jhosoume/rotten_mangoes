# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [
  User.create!(
    email: 'someone@example.com', 
    password: '123456',
    firstname: 'Some',
    lastname: 'One',
    admin: true
  ),
  User.create!(
    email: 'someone1@example.com', 
    password: '123456',
    firstname: 'Some1',
    lastname: 'One1',
    admin: true
  ),
  User.create!(
    email: 'someone2@example.com', 
    password: '123456',
    firstname: 'Some2',
    lastname: 'One2'
  ),
  User.create!(
    email: 'someone3@example.com', 
    password: '123456',
    firstname: 'Some3',
    lastname: 'One3'
  ),
  User.create!(
    email: 'someon4e@example.com', 
    password: '123456',
    firstname: 'Some4',
    lastname: 'One4'
  ),
  User.create!(
    email: 'someone5@example.com', 
    password: '123456',
    firstname: 'Some5',
    lastname: 'One5'
  ),
  User.create!(
    email: 'someone6@example.com', 
    password: '123456',
    firstname: 'Some6',
    lastname: 'One6'
  ),
  User.create!(
    email: 'someone7@example.com', 
    password: '123456',
    firstname: 'Some7',
    lastname: 'One7'
  ),
  User.create!(
    email: 'someone8@example.com', 
    password: '123456',
    firstname: 'Some8',
    lastname: 'One8'
  ),
  User.create!(
    email: 'someone9@example.com', 
    password: '123456',
    firstname: 'Some9',
    lastname: 'One9'
  ),
  User.create!(
    email: 'someone10@example.com', 
    password: '123456',
    firstname: 'Some10',
    lastname: 'One10'
  ),
  User.create!(
    email: 'someone11@example.com', 
    password: '123456',
    firstname: 'Some11',
    lastname: 'One11'
  )
]


