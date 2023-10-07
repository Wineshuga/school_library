require "./book.rb"
require "./student"
require "./teacher"
require "./rental"
require "./classroom"

class App
  attr_accessor :input, :person, :students, :people, :books, :rentals

  def initialize()
    @input = ''
    @person = ''
    @books = []
    @people = []
    @rentals = []
  end

  def welcome_msg
    puts "Welcome to school library app"
  end

  def message
    puts "
    Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit
    "
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    run
  end

  def list_people
    @people.each_with_index do |people, index|
      puts "#{index + 1}. #{people.name} - ID: #{people.id}"
    end
    run
  end

  def create_person
    puts "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
    @person = gets.chomp
    if @person == '1'
      create_student
    else
      create_teacher
    end
  end

  def create_student
    print "Age: "
    age = gets.chomp
    print "Name: "
    name = gets.chomp
    print "Has parent permission? [Y/N]: "
    permission = gets.chomp
    permission = permission.downcase == 'y'
    classroom = Classroom.new('Grade 1')
    student = Student.new(age, classroom, name, parent_permission: permission)
    classroom.add_student(student)
    @people << student
    puts "Person created successfully"
    run
  end

  def create_teacher
    print "Age: "
    age = gets.chomp
    print "Name: "
    name = gets.chomp
    print "Specialization: "
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts "Person created successfully!"
    run
  end

  def run
    message
    @input = gets.chomp
    choice
  end

  def choice
    case input
      when '1'
        list_books
      when '2'
        list_people
      when '3'
        create_person
      when '4'
        create_book
      when '5'
        create_rental
      when '6'
        list_rental
      when '7'
        puts "Goodbye!"
        exit
      else
        puts "Invalid number"
        run
    end
  end

  def create_book
    print "Title: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book created successfully!"
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
        rental = @rentals.select { |rental| rental.person.id == id }
  
        if rental.empty?
          puts 'Rentals: '
          run
        else
          puts 'Rentals: '
          puts ''
          rental.each_with_index do |rental, _index|
            puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}."
          end
          run
        end
      end
  end
end
