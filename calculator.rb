def zero(operation = nil)
  operation ? operation.call(0) : 0
end

def one(operation = nil)
  operation ? operation.call(1) : 1
end

def two(operation = nil)
  operation ? operation.call(2) : 2
end

def three(operation = nil)
  operation ? operation.call(3) : 3
end

def four(operation = nil)
  operation ? operation.call(4) : 4
end

def five(operation = nil)
  operation ? operation.call(5) : 5
end

def six(operation = nil)
  operation ? operation.call(6) : 6
end

def seven(operation = nil)
  operation ? operation.call(7) : 7
end

def eight(operation = nil)
  operation ? operation.call(8) : 8
end

def nine(operation = nil)
  operation ? operation.call(9) : 9
end

def plus(right_operand)
  ->(left_operand) { left_operand + right_operand }
end

def minus(right_operand)
  ->(left_operand) { left_operand - right_operand }
end

def times(right_operand)
  ->(left_operand) { left_operand * right_operand }
end

def divided_by(right_operand)
  ->(left_operand) { left_operand / right_operand }
end

if __FILE__ == $0
  if ARGV.length == 1
    result = eval(ARGV[0])
    puts result
  else
    puts "Usage: ruby calculator.rb \"seven(times(five))\""
  end
end

