require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(name, age, _parent_permission)
    super(name, age, parent_permission: true)
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
