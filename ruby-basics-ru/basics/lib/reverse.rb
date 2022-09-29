# frozen_string_literal: true

# BEGIN
def reverse(str)
  str.each_char.with_object(String.new) { |c, result| result.prepend(c) }
end
# END
