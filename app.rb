require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'person'



class App
  attr_accessor :rentals, :books, :people

  def initialize
    @rentals = []
    @books = []
    @people = []
  end

  def create_person
    puts "Do you want to create a student (1) or a teacher (2)? [Input the number]: "
    person_index = gets.chomp.to_i
   if person_index == 1
    create_student
   elsif person_index == 2
    create_teacher
   else 
    puts "Invalid choice"
   end
  end

  def create_student
    print "Age: "
    age = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    print "Has parent permission? [Y/N]: "
    parent_permission = gets.chomp.capitalize
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    else
      puts "Please enter a valid choice"
    end

    student = Student.new(age, name, parent_permission);
    @people.push(student)
    puts "Person created successfully "
  end

  def create_teacher
    print "Age: "
    age = gets.chomp.to_i
    print "Name: "
    name = gets.chomp
    print = "Specialization: "
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    puts "Person created successfully"
  end

  def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book created successfully"
  end

  def list_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end
end