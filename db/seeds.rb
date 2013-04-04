Exercise.delete_all
Option.delete_all
Person.delete_all
Quiz.delete_all
Result.delete_all
Tag.delete_all

p1 = Person.create(name: 'Bob', address: '10 East 21st NY', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a', phone: '47282847', image_file: 'jess.JPG')
p2 = Person.create(name: 'Jess', address: '50 8th Avenue, Manhattan, NY', email: 'jess@gmail.com', password: 'a', password_confirmation: 'a', phone: '99683727', image_file: 'jess.JPG')
p3 = Person.create(name: 'Jan', address: '106 Ridge Street, Manhattan, NY', email: 'jan@gmail.com', password: 'a', password_confirmation: 'a', phone: '96847256', image_file: 'jess.JPG')



e1 = Exercise.create(question: 'What is the difference between a Symbol and String?', difficulty: '5', rating: '4', is_public: true, cost: 5.50)


