class Triangle

  attr_accessor :lengthone, :lengthtwo, :lengththree

  def initialize(lengthone, lengthtwo, lengththree)
    @lengthone = lengthone
    @lengthtwo = lengthtwo
    @lengththree = lengththree
    @lengths = [@lengthone, @lengthtwo, @lengththree]
  end

  def valid?
    (@lengthone + @lengthtwo > @lengththree) &&
    (@lengthtwo + @lengththree > @lengthone) &&
    (@lengthone + @lengththree > @lengthtwo)
  end

  def negative?
    @lengths.each do |length|
      if(length <= 0)
        return true
      end
    end
  end

  def kind
    if (negative? == true || valid? == false)
        raise TriangleError
    elsif (@lengthone == @lengthtwo) &&
          (@lengthtwo == @lengththree)
            :equilateral
    elsif (@lengthone == @lengthtwo) ||
          (@lengthtwo == @lengththree) ||
          (@lengthone == @lengththree)
            :isosceles
    elsif (@lengthone != @lengthtwo) &&
          (@lengthtwo != @lengththree) &&
          (@lengthone != @lengththree)
            :scalene
    end
  end
  class TriangleError < StandardError
    def message
      "This is not a triangle!"
    end
  end
end
