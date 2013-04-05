Exercise.delete_all
Option.delete_all
Person.delete_all
Quiz.delete_all
Result.delete_all
Tag.delete_all

p1 = Person.create(name: 'Bob', address: '10 East 21st NY', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a', phone: '47282847', image_file: 'jess.JPG')
p2 = Person.create(name: 'Jess', address: '50 8th Avenue, Manhattan, NY', email: 'jess@gmail.com', password: 'a', password_confirmation: 'a', phone: '99683727', image_file: 'jess.JPG')
p3 = Person.create(name: 'Jan', address: '106 Ridge Street, Manhattan, NY', email: 'jan@gmail.com', password: 'a', password_confirmation: 'a', phone: '96847256', image_file: 'jess.JPG')

e1 = Exercise.create(question: 'What is the difference between a Symbol and String?', difficulty: 5, rating: 4, is_public: 'true', cost: 2.50)
e2 = Exercise.create(question: 'What is a Range?', difficulty: 5, rating: 4, is_public: 'true', cost: 1.50)
e3 = Exercise.create(question: "What is the convention for using a bang at the end of a method name?", difficulty: 3, rating: 4, is_public: 'true', cost: 1.50)
e4 = Exercise.create(question: 'Does Ruby support multiple inheritance?', difficulty: 5, rating: 6, is_public: 'true', cost: 2.50)
e5 = Exercise.create(question: 'What do controllers do in Rails?', difficulty: 5, rating: 3, is_public: 'true', cost: 1.50)
e6 = Exercise.create(question: 'What is flash in Rails?', difficulty: 6, rating: 7, is_public: 'true', cost: 1.50)
e7 = Exercise.create(question: 'What is a module?', difficulty: 6, rating: 7, is_public: 'true', cost: 1.50)

q1 = Quiz.create(name: 'Rails quiz')
q2 = Quiz.create(name: 'Rails quiz II')
q3 = Quiz.create(name: 'Rails quiz III')

o1 = Option.create(answer: 'Flash is a way to pass some value to the next action.', is_correct: true)
o2 = Option.create(answer: 'Flash is part of the MVC.', is_correct: false)
o3 = Option.create(answer: 'Flash is a kind of variable.', is_correct: false)
o4 = Option.create(answer: 'Flash is a Ruby gem.', is_correct: false)
o5 = Option.create(answer: 'Once a request comes into the Rails stack, it goes to the routes table to determine which controller and action should be called.', is_correct: true)
o6 = Option.create(answer: 'Controllers allow the browser to communicate with Rails', is_correct: false)
o7 = Option.create(answer: 'When a request comes from the browser, a controller will allow the correct html to be rendered', is_correct: false)
o8 = Option.create(answer: 'Controllers are Rails helpers that direct the user navigation in Rails', is_correct: false)
o9 = Option.create(answer: 'No', is_correct: true)
o10 = Option.create(answer: 'Yes', is_correct: false)
o11 = Option.create(answer: 'Symbols and string are used interchangeably but the main difference is that symbols take up less space in memory.', is_correct: true)
o12 = Option.create(answer: 'Symbols and string are a way of avoiding using quotation marks and escape characters.', is_correct: false)
o13 = Option.create(answer: 'Symbols and string differ in that one is a variable and one is a constant', is_correct: false)
o14 = Option.create(answer: 'Symbols and strings are exactly the same', is_correct: false)
o15 = Option.create(answer: 'The ! indicates that an error has occurred', is_correct: false)
o16 = Option.create(answer: 'The ! indicates that the method is about to change the object itself.', is_correct: true)
o17 = Option.create(answer: 'The ! indicates that Rails is excited.', is_correct: false)
o18 = Option.create(answer: 'The ! indicates that the object is uniniialized.', is_correct: false)
o19 = Option.create(answer: 'Range is a way to declare continuous variables.', is_correct: true)
o20 = Option.create(answer: 'Range is a series of numbers.', is_correct: true)
o21 = Option.create(answer: 'Range is a kind of array.', is_correct: false)
o22 = Option.create(answer: 'Range is a sequence of numbers.', is_correct: false)

r1 = Result.create(score: 5.5)
r2 = Result.create(score: 6.5)
r3 = Result.create(score: 8.5)
r4 = Result.create(score: 4.5)
r5 = Result.create(score: 9.5)
r6 = Result.create(score: 2.5)


e2.options = [o19, o20, o21, o22]
e3.options = [o15, o16, o17, o18]
e4.options = [o9, o10]
e5.options = [o5, o6, o7, o8]
e6.options = [o1, o2, o3, o4]

p1.results = [r1, r2]
p2.results = [r3, r4]
p3.results = [r5, r6]

q1.results = [r1, r2]
q2.results = [r3, r4]
q3.results = [r5, r6]
