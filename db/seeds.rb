user =  User.create(name: 'John Goodman', email: 'john@poeticsystems.com', password: 'Jgpass538', password_confirmation: 'Jgpass538')
user.admin!

User.create(name: 'Saul Williams', email: 'saul@example.com', password: 'password', password_confirmation: 'password', start_date: '2015-03-10'.to_date)
User.create(name: 'Sally Mill', email: 'sally@example.com', password: 'password', password_confirmation: 'password', start_date: '2016-05-10'.to_date)