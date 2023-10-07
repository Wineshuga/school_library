require './book'
require './student'
require './teacher'
require './rental'
require './classroom'
require './app_alt'

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
    puts 'Welcome to school library app'
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
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    @person = gets.chomp
    if @person == '1'
      create_student
    else
      create_teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission = permission.downcase == 'y'
    classroom = Classroom.new('Grade 1')
    student = Student.new(age, classroom, name, parent_permission: permission)
    classroom.add_student(student)
    @people << student
    puts 'Person created successfully'
    run
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    @people << teacher
    puts 'Person created successfully!'
    run
  end

  def run
    message
    @input = gets.chomp
    choice
  end

  def choice_alt
    case input
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    end
  end

  def choice
    choice_alt
    case input
    when '5'
      create_rental
    when '6'
      list_rental
    when '7'
      exit_application
    else
      handle_invalid_choice
    end
  end

  def exit_application
    puts 'Goodbye!'
    exit
  end

  def handle_invalid_choice
    puts 'Invalid number'
    run
  end

  include AppAlt
end
