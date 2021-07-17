class Triangle
  attr_reader :type
  attr_accessor :ls1, :ls2, :ls3

  def initialize(ls1,ls2,ls3)
    @ls1 = ls1
    @ls2 = ls2
    @ls3 = ls3
  end
  
  def kind

    #
    # The order of these statements matter in this method
    #

    is_error = nil
    is_error = 1 unless (@ls1 > 0 && @ls2 > 0 && @ls3 > 0)
    ay = [@ls1, @ls2, @ls3].sort
    is_error = 1 unless (ay[0] + ay[1]) > ay[2]
    
    raise TriangleError if is_error

    @type = :scalene
    @type = :isosceles if ay[0] == ay[1] || ay[1] == ay[2]
    @type = :equilateral if ay[0] == ay[2]
    @type
  end

  class TriangleError < StandardError
    # triangle error code
  end
end


# The official solution also works and is reprinted below
#

=begin

class Triangle
  attr_reader :a, :b, :c
  
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [a, b, c].all?(&:positive?)
  end

  def valid_triangle_inequality?
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end

end
 
=end
