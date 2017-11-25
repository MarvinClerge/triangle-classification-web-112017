class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @check1 = side1+side2
    @check2 = side2+side3
    @check3 = side1+side3
  end

  def kind
    #check if our triangles are valid
    if side1 > 0 && side2 > 0 && side3 > 0
      if @check1 > side3 && @check2 > side1 && @check3 > side2

        if side1 == side2 && side2 == side3 #check if equilateral
          :equilateral
        elsif side1 == side2 || side2 == side3 || side1 == side3 #check if isosceles
          :isosceles
        else #if triangle is neither it is scalene
          :scalene
        end

      else
        raise TriangleError #Triangle violates triangle inequality
      end

    else
      raise TriangleError #Triangle side(s) 0 or negative
    end
  end



  # :equilateral  :isosceles  :scalene
end

class TriangleError < StandardError
  def message
    "Error: Invalid triangle"
  end
end
