require_relative 'people'

class PeopleRecords
  attr_reader :list

  def initialize
    @list = []
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_index = gets.chomp.to_i
    case person_index
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid choice'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.capitalize
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts 'Please enter a valid choice'
    end

    student = Student.new(age, name, parent_permission)
    @list.push(student)
    puts 'Person created successfully '
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    puts 'Person created successfully'
    @list << teacher
  end

  def list_people
    if @list.length.positive?
      @list.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'People list is empty'
    end
    # @list = People.new(@people)
  end
end
