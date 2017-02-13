# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(user_name: "Claire")
User.create(user_name: "Andrew")
User.create(user_name: "Leo")
User.create(user_name: "Otto")
User.create(user_name: "Gandalf")
User.create(user_name: "The Old Man")

Poll.create(title: "The Bridge Of Doom", author_id: 6)
Poll.create(title: "Middle Earth", author_id: 5)

Question.create(text: "What is your name?", poll_id: 1)
Question.create(text: "What is your quest?", poll_id: 1)
Question.create(text: "What is your favorite color?", poll_id: 1)
Question.create(text: "What is the airspeed velocity of an unladen swallow?", poll_id: 1)

Question.create(text: "What's in your pocket?", poll_id: 2)
Question.create(text: "Grey or white?", poll_id: 2)
Question.create(text: "Is it left or right to Mordor?", poll_id: 2)

Answer.create(text: "Sir Lancelot", question_id: 1)
Answer.create(text: "None of your business", question_id: 1)

Answer.create(text: "To seek the Holy Grail", question_id: 2)
Answer.create(text: "To destroy the one ring", question_id: 2)
Answer.create(text: "Dinner", question_id: 2)

Answer.create(text: "Blue", question_id: 3)
Answer.create(text: "Yellow", question_id: 3)
Answer.create(text: "I don't know!! :(", question_id: 3)

Answer.create(text: "42", question_id: 4)
Answer.create(text: "What do you mean? An African or European swallow?", question_id: 4)

Answer.create(text: "Nothing", question_id: 5)
Answer.create(text: "A hole", question_id: 5)
Answer.create(text: "The one ring...I mean, nothing.", question_id: 5)

Answer.create(text: "Grey", question_id: 6)
Answer.create(text: "White", question_id: 6)
Answer.create(text: "Blue", question_id: 6)

Answer.create(text: "Left", question_id: 7)
Answer.create(text: "Right", question_id: 7)

Response.create(user_id: 1, answer_id: 2)
Response.create(user_id: 1, answer_id: 3)
Response.create(user_id: 1, answer_id: 6)
Response.create(user_id: 1, answer_id: 10)


Response.create(user_id: 2, answer_id: 13)
Response.create(user_id: 2, answer_id: 16)
Response.create(user_id: 2, answer_id: 18)

Response.create(user_id: 3, answer_id: 1)
Response.create(user_id: 3, answer_id: 8)
Response.create(user_id: 3, answer_id: 17)
