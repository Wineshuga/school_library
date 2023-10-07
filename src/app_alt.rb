module AppAlt
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully!'
    run
  end

  def display_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def display_people
    @people.each_with_index do |people, index|
      puts "#{index}) [#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
  end

  def create_rental
    if people.length.positive? && books.length.positive?
      puts 'select a book from the following list by number'
      display_books
      book_input = gets.chomp.to_i
      puts 'select a person from the following list by number (not id)'
      display_people
      person_input = gets.chomp.to_i
      selected_book = books[book_input]
      selected_person = people[person_input]
      print 'Date: '
      date = gets.chomp
      new_rental = Rental.new(date, selected_book, selected_person)
      @rentals << new_rental
      puts 'Rental created successfully'
      run
    end
    run
  end

  def list_rental
    if @rentals.empty?
      puts 'Sorry, No rentals'
    else
      print 'ID of person: '
      id = gets.chomp.to_i
      rental = @rentals.select { |element| element.person.id == id }

      puts 'Rentals: '
      unless rental.empty?
        puts ''
        rental.each_with_index do |element, _index|
          puts "Date: #{element.date}, Book: #{element.book.title} by #{element.book.author}."
        end
      end
      run
    end
  end
end
