class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    raise ZeroDivisionError if b == 0
    a / b.to_f
  end

  def power(a, b)
    a ** b
  end

  def modulo(a, b)
    raise ZeroDivisionError if b == 0
    a % b
  end
end

def get_number(prompt)
  loop do
    print prompt
    input = gets.chomp
    return Float(input) rescue (puts "Invalid number. Try again."; next)
  end
end

def get_operation
  valid_ops = ['+', '-', '*', '/', '**', '%']
  loop do
    print "Enter operation (+, -, *, /, **, %): "
    op = gets.chomp
    return op if valid_ops.include?(op)
    puts "Invalid operation. Try again."
  end
end

calc = Calculator.new

loop do
  num1 = get_number("Enter first number: ")
  operator = get_operation
  num2 = get_number("Enter second number: ")

  result = case operator
           when '+' then calc.add(num1, num2)
           when '-' then calc.subtract(num1, num2)
           when '*' then calc.multiply(num1, num2)
           when '/' then calc.divide(num1, num2)
           when '**' then calc.power(num1, num2)
           when '%' then calc.modulo(num1, num2)
           end

  puts "Result: #{result}"

  print "\nPerform another calculation? (y/n): "
  break unless gets.chomp.downcase.start_with?('y')
  puts
end
