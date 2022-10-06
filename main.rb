require_relative 'app'

def start_app(app, choice)
  case choice
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  else
    puts "Invalid choice"
  end
end

def main
  app = App.new()
  puts "Welcome to school library App"
  loop do
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "7 - Exit"
    choice = gets.chomp.to_i
    if choice == 7
      puts "Thank you for using our library"
      break
    end

    start_app(app, choice)
  end
end

main