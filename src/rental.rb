class rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rental << self
  end
end