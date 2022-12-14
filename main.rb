require_relative 'app'

def start_app(app, choice)
  case choice
  when 1
    app.books.list_books
  when 2
    app.people.list_people
  when 3
    app.people.create_person
  when 4
    app.books.create_book
  when 5
    app.rentals.create_rental(app.books.list, app.people)
  when 6
    app.rentals.list_rentals(app.people)
  else
    puts 'Invalid choice'
  end
end

def main
  app = App.new
  puts 'Welcome to school library App'
  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    choice = gets.chomp.to_i
    if choice == 7
      puts 'Thank you for using our library'
      break
    end

    start_app(app, choice)
  end
end

main
