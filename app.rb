require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'person'
require_relative './rental_records'

class App
  attr_accessor :rentals, :books, :people

  def initialize(rental_records = RentalRecords.new)
    @rentals = rental_records
    @books = []
    @people = []
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
    @people.push(student)
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
    @people << teacher
  end

  def list_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    else
      puts 'The book list is empty'
    end
  end

  def list_people
    if @people.length.positive?
      @people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts 'People list is empty'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end
end
