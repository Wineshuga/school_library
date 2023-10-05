require './nameable'

class Decorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    nameable = @nameable.correct_name
    if nameable.length > 10
      nameable.slice(0, 10)
    else
      nameable
    end
  end
end
