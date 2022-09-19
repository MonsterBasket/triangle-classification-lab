require 'pry'

class Triangle
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def isValid?
    # testing:          if a/b/c are not nil -  if a/b/c are > 0            - if any two sides are greater than the third  - probably a nicer way to do this
    raise TriangleError unless !!a && !!b && !!c && a > 0 && b > 0 && c > 0 && a + b > c && b + c > a && a + c > b
  end

  def kind
    isValid? 
    return :equilateral if a == b && a == c
    sides = [a,b,c].sort
    ra = ""
    ra = "right_angle_" if sides[0]**2 + sides[1]**2 == sides[2]**2
    return "#{ra}isosceles".to_sym if a == b || a == c || b == c
    "#{ra}scalene".to_sym
  end

  class TriangleError < StandardError
    def message
      "Invalid Triangle"
    end
  end
end

binding.pry