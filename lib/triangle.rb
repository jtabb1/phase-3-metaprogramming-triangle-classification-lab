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