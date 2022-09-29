# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return if num.negative?
  return num if num <= 1

  last = 1
  current = 1

  (num - 2).times { last, current = current, last + current }

  current
end
# END
