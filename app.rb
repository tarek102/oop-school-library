require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'person'
require_relative 'books'

class App
  attr_accessor :rentals, :books, :people

  def initialize ()
    @rentals = []
    @books = []
    @people = []
    @books = Books.new(@books)
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

  # start app

  def options
    puts 'Welcome to school library App'

    loop do
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals fr a given person id'
      puts '7 - Exit'
      choice = gets.chomp.to_i
      if choice == 7
        puts 'Thank you fr using our library'
        break
      end

      start_app(choice)
    end
  end

  def start_app(choice)
    case choice
    when 1
      @books.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      @books.create_book
    when 5
      app.create_rental
    when 6
      app.list_rentals
    else
      puts 'Invalid choice'
    end
  end
end
