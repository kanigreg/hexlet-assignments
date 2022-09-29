# frozen_string_literal: true

# BEGIN
def anagramm_filter(check_word, words)
  sorted_chars = check_word.chars.sort
  words.filter { |word| word.chars.sort == sorted_chars }
end
# END
