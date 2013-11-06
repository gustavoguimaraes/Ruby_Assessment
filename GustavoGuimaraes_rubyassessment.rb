# GustavoGuimaraes_RubyAssessment

# 1. Arrays .a
array = ["Blake", "Ashley", "Jeff"]
array.push "Gustavo"

# 1.Arrays .b  
puts array

#1.Arrays .c
array[1]

#1.Arrays .d
array.index("Jeff")

#2. Hashes a
instructor = {:name =>"Ashley", :age => 27}

instructor[:location] = "NYC"

# 2.Hashes b 
instructor

# 2.Hashes c 
instructor[:name]

#2.Hashes d
instructor.each { |key , value| puts key if value == 27 }
or
instructor.keys[1]


#3 Nested Structures

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

#3. a
school[:founded_in] = 2013

#3. b

school[:students].push( {:name=> "Gus", :grade=> "A"} )

#3.c
school[:students].delete({:name=> "Billy", :grade=> "F"})

#3. d

school[:students].each { | name | name[:semester] = "Summer"} 

#3.e
school[:instructors].each do | instructors |
    if instructors[:name] == "Ashley"
       instructors[:subject] = "being almost better than Blacke"
	  end
end

#3.f

school[:students].each do |student|
  if student[:name] == "Frank"
    student[:grade] = "F"
  end
end

#3. g

  answer = " "
 school[:students].each do | name |
    if name[:grade] == "B"
      answer = name[:name]
    end
  end

  answer

#3.h
  answer = " "
school[:instructors].each do |name|  
  if name[:name] == "Jeff" 
    answer = name[:subject] 
  end 
end

answer


#3. i


#4. Methods

# 4. a
def grade_student(name, school_var)
  school_var [:students].each do | elem |
    if  elem[:name] == name
      return elem[:grade]
    end
  end
end

 grade_student("Frank", school)

 # 4.b
def update_subj (instr, school_var, new_subj)
  school_var [:instructors].each do | elem |
    if  elem[:name] == instr
      elem[:subject] = new_subj
    end
  end
end

update_subj("Blake", school, "Being horrible")

# 4. c

def add_student (new_stu, school_var)
  school_var[:students].push({:name =>new_stu}) 
end

add_student ("Gus", school)

# 4. d

def add_new_key (new_key, new_value, school_var)
  school_var[new_key] = new_value
end

add_new_key(:Ranking, 1 , school)

# 5 Object Orientation

# 5. a, b
class School

def initialize (name, location, ranking, students, instructors)
@name = name
@location = location
@ranking = ranking
@students = [students]
@instructors = instructors
SCHOOLS.push self
  end

# 5. c
attr_accessor :name, :location, :instructors, :students
attr_reader :Ranking
SCHOOLS = []

# 5. d
def set_ranking(new_ranking)
ranking = new_ranking
  
end

# 5. e
def add_student(name, grade, semester)
  students.push [{:name=> name, :grade=> grade, :semester=> semester}]
end

# 5.f

def remove_student (name, grade, semester)
students.delete [{:name=> name, :grade=> grade, :semester=> semester}]
end

# 5. g and h
def School.reset

SCHOOLS.clear
end


end

# Testing all the exercise 5 methods

flatiron =School.new("flatiron", "bk", 1 , "Sarah", "Blake")

flatiron.set_ranking(5)

flatiron.add_student("Gus", 12,"Summer")

flatiron.add_student("Angela", 15,"Summer")

flatiron.remove_student("Angela", 15, "Summer")

School.reset


#6 Classes

# 6. a
class Student

  def initialize (name, grade, semester)

    @name = name
    @grade = grade
    @semester = semester

  end

end

class School

  
  attr_accessor :name, :location, :instructors, :students
  attr_reader :Ranking
  SCHOOLS = []

  def initialize (name, location, ranking)
    @name = name
    @location = location
    @ranking = ranking
    @students = []
    @instructors = []
    SCHOOLS.push self
  end


  def set_ranking(new_ranking)
    ranking = new_ranking 
  end

   # 6. b 
  def add_student(name, grade, semester)
    students.push Student.new(name, grade, semester)
  end

 
   # 6. c
  def find_student(name)
    if name == students
      return students
    end
  end

  
  def School.reset
    SCHOOLS.clear
  end

end
# Testing the mesthods from exercise 6
flatiron = School.new ("Flatiron", "BK", 1)

flatiron.add_student("Gus", "A", "Fall")

flatiron.find_student("Gus")

# 7 Self

# 7. a  It will print "hello" and the name of the class i.e. "Student"

# 7. b  It will call the method  say_hello which in that example prints the Student class. In other words it will print: "Student"

# 7. c I didn't know

# 7. d I didn't know

# 7. e  it should print "goodbye"