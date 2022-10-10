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

  def list_books
    if @books.length.positive?
      @books.each do |book|
        puts "Title: \"#{book.title}\", Author: #{book.author}"
      end
    else
      puts 'The book list is empty'
    end
  end

  def create_rental
    return unless @books.length.positive?

    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_choice = gets.chomp.to_i
    puts 'select a person from the following list by number (not id)'
    return unless @people.length.positive?

    @people.each_with_index do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_choice = gets.chomp.to_i
    puts 'Date: '
    date_choice = gets.chomp
    rental = Rental.new(date_choice, @people[person_choice], @books[book_choice])
    @rentals << rental
    puts 'Rental created successfully'
  end

  def list_rentals
    if @rentals.length.positive?
      print 'ID of person : '
      person_id = gets.chomp.to_i
      @people.each do |person|
        next unless person.id == person_id

        person.rentals.each_with_index do |rental, _i|
          puts " \n Rentals: \n Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
        end
      end

    else
      puts 'Rentals list is empty'
    end
  end
end
