# frozen_string_literal: true

# BEGIN
def resolve_string_value(num)
  if (num % 3).zero? && (num % 5).zero?
    'FizzBuzz'
  elsif (num % 3).zero?
    'Fizz'
  elsif (num % 5).zero?
    'Buzz'
  else
    num.to_s
  end
end

def fizz_buzz(left, right)
  return if right < left

  left
    .upto(right)
    .with_object([]) { |i, acc| acc << resolve_string_value(i) }
    .join(' ')
end
# END
