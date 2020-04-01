require('pry-byebug')
require_relative('../models/student.rb')
require_relative('../models/house.rb')


House.delete_all()
Student.delete_all()


house1 = House.new({'house_name' => 'Gryffindor',
                    'logo' => '/gryffindor.jpg'})

house2 = House.new({'house_name' => 'Slytherin',
                    'logo' => '/slytherin.png'})

house1.save()
house2.save()


student1 = Student.new({'first_name' => 'Harry',
                        'last_name' => 'Potter',
                        'age' => 14,
                        'house_id' => house1.id })

student2 = Student.new({'first_name' => 'Draco',
                        'last_name' => 'Malfoy',
                        'age' => 14,
                        'house_id' => house2.id })

student1.save()
student2.save()


binding.pry
nil
