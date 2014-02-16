 require 'ap'

# 1. Arrays

array = ["Blake","Ashley","Jeff"]

# a. Add a element to an array

array << "Gus"


# b. Write a statement to print out all the elements of the array. This should not be just puts my_hash but should iterate over the structure printing each value.
  
  array.each{|element|  element}

# c. Return the value at index 1.
 array[1]
# d. Return the index for the value "Jeff".
 array[2]

# 2. Hashes

instructor = {:name=>"Ashley", :age=>27}

# a. Add a new key for location and give it the value "NYC".

instructor[:location] = "NYC"


# b. Write a statement to print out all the key/value pairs in the hash. This should not be just puts my_hash but should iterate over the structure printing each individual key and value.

instructor.each{|key, value| p "key is #{key} and value is #{value}"}

# c. Return the name value from the hash.

instructor[:name]

# d. Return the key name for the value 27.

instructor.each{|k,v|  k if v == 27}

# 3. Nested Structures

school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}
# a. Add a key to the school hash called "founded_in" and set it to the value 2013.
school[:founded_in] = 2013

# b. Add a student to the school's students' array.
school[:students] << {:name =>"Gus", :grade => "A"}

# c. Remove "Billy" from the students' array. Create a solution that would work for any name given, then give it the name "Billy".
 to_remove = "Billy"
school[:students].delete_if{|hash_elem| hash_elem[:name] == to_remove}

# d. Add a key to every student in the students array called "semester" and assign it the value "Summer".
school[:students].each{|hash_element| hash_element[:semester] = "Summer"}

# e. Change Ashley's subject to "being almost better than Blake". Create a solution that would work for any teacher given, then give it the teacher "Ashley".
change_subject = "being almost better than Blake"
teacher_name = "Ashley"

school[:instructors].each{|hash_element| hash_element[:subject] = change_subject if hash_element[:name] == teacher_name}

# f. Change Frank's grade from "A" to "F". Create a solution that would work for any intial and replacement grade given, then give it the grades and "A" and "F".

grade_change = "F"
student_name = "Frank"

school[:students].each{|hash_element| hash_element[:grade] = grade_change if hash_element[:name] == student_name}



# g. Return the name of the student with a "B". Create a solution that would work for any grade given, then give it the grade "B".

search_student_with_B = "B" 

school[:students].each{|hash_elem|  hash_elem[:name] if hash_elem[:grade] == search_student_with_B}



# h. Return the subject of the instructor "Jeff". Create a solution that would work for any instructor given, then give it the instructor "Jeff" and the new subject.

subject_of_instructor = "Jeff"

school[:instructors].each{|hash_elem|  hash_elem[:subject] if hash_elem[:name] == subject_of_instructor}



# i. Write a statement to print out all the values in the school. This should not be just puts my_hash but should iterate over the structure printing each individual key and value.

school.each{|k,v|  v unless k == :instructors || k == :students}

school[:instructors].each do |k|
   k.each do |key, value|
      value
  end
end 

school[:students].each do |k|
   k.each do |key, value|
      value
  end
end 

# 4. Methods

# Note: You will need to pass the school variable to each of these methods to include it in scope.

# a.
# i. Create a method to return the grade of a student, given that student's name. ii. Then use it to refactor your work in 3.i., i.e. use your method to replace some of the iteration that was initiailly required.

def student_grade(name, school_hash)
  school_hash[:students].each{|hash_elem|  hash_elem[:grade] if hash_elem[:name] == name}
end

student_grade("Gus", school)

# b. i.Create a method to udpate a instructor's subject given the instructor and the new subject. ii. Then use it to update Blake's subject to "being terrible".

def instructor_subject(instr, school_hash)
  school_hash[:instructors].each{|hash_elem| hash_elem[:subject] = "being horrible" if hash_elem[:name] == instr}
end

instructor_subject("Blake", school)


# c. i. Create a method to add a new student to the schools student array. ii. Then use it to add yourself to the school students array.

def add_student(name, school_hash)
  school_hash[:students] << {:name => name}
end

add_student("NewStudent", school)



# d. i. Create a method that adds a new key at the top level of the school hash, given a key and a value. ii. Then use it to add a "Ranking" key with the value 1.

def add_new_key(newkey, newvalue, school_hash)
  school_hash[newkey.to_sym] = newvalue
end

add_new_key("ranking",1, school)



# 5. Object Orientation

# a. Create a bare bones class definition for a School class.
 class School
  attr_accessor :name, :location, :instructors, :students
  SCHOOLS = []
  def initialize(name, location)
    @name = name
    @location = location
    @ranking
    @students = []
    @instructors = []
    SCHOOLS << self
  end
 
  def set_ranking(ranking_value)
    @ranking = ranking_value
  end

  def add_student(name, grade, semester)
    students << Student.new(name, grade, semester)
  end

  def find_student(student_name)
    SCHOOLS.each do |elem|
        array = elem.students 
        array.each{|e| p e if e.name == student_name}
    end
  end

  def add_instructor(name, subj)
    instructors << {:name => name, :subject => subj} 
  end

  def remove_student(name)
    students.delete_if{|e| e[:name] == name}
  end

  def reset_schools
    SCHOOLS.clear
  end

  def print_constant
    p SCHOOLS
  end

 end


# 6. Classes

# a. Create a Student class.
# b. Refactor your School instance methods to treat Students as an array of objects instead of an array of hashes.
# c. Create a method in the School class that finds a student by name and returns the correct Student object.

class Student
  
  attr_accessor :name, :grade, :semester

  def initialize(name, grade, semester)
    @name = name
    @grade = grade
    @semester = semester
  end


end

 sch = School.new("Happy Funtime School","NYC")
 sch.set_ranking(1)
 sch.add_student("Gus","A","Winter")
 sch.add_instructor("Blake", "SQL")
 sch.print_constant
 sch.find_student("G")




# 7. Self

# For this section, please use the letters and answer each individually.

# Note: in cases where self is an instance of an object just note that as the object id printed to the screen is going to be different everytime

# a.What should this Class print to the screen when defined/loaded?

  class Student

    def self.say_hello
      puts "hello"
    end

    say_hello
    puts self

  end

  print "hello" and an instance/object of the class Student

# b. What should this Class print to the screen when defined/loaded?

  class Student


    def self.say_hello
      puts self
    end

    say_hello

  end

  an instance of the class student
# c. What should this Class print to the screen when defined/loaded?

  class Student

    def initialize
      puts self
    end

    new

  end
  print an new object of the class Student

# d. What should this code print to the screen when run?

  class Student

    def say_hello
      puts self
    end

  end
Student.new.say_hello
    print an instance/the object of the Student class

# e. What should this code print to the screen when run?

  class Student

    def say_hello
      puts say_goodbye
    end

    def say_goodbye
      "goodbye"
    end

  end
Student.new.say_hello
   print "goodbye" to the screen