require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry')

Student.delete_all()
House.delete_all()

house1 = House.new({
  'name' => 'Gryffindor',
  'logo' => './gryffindor.jpg'
  })

  house1.save()

house2 = House.new({
  'name' => 'Ravenclaw',
  'logo' => './gryffindor.jpg'
  })

  house2.save()

house3 = House.new({
  'name' => 'Slytherin',
  'logo' => './gryffindor.jpg'
  })

  house3.save()

house4 = House.new({
  'name' => 'Hufflepuff',
  'logo' => './gryffindor.jpg'
  })

  house4.save()


student1 = Student.new({
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'house' => house1.id,
  'age' => 15
  })

  student1.save()

student2 = Student.new({
  'first_name' => 'Ron',
  'last_name' => 'Weasley',
  'house' => house1.id,
  'age' => 15
  })

  student2.save()

binding.pry
nil
