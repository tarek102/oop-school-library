require_relative 'book'
require 'json'

class BookRecords
  attr_reader :list, :location
  def initialize
    @location = 'json_book.json'
    file = File.open(@location, 'a+')
    @list = file.size.zero? ? [] : JSON.parse(file.read)
    file.close
  end

  def create_book
    file = File.open(@location, 'w')
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    book = book.to_json
    @list << book
    file.write(JSON[@list])
    file.close
    puts 'Book created successfully'
  end

  def list_books
    if @list.length.positive?
      @list.each do |book|
        puts "Title: \"#{book['title']}\", Author: #{book['author']}"
      end
    else
      puts 'The book list is empty'
    end
  end
end