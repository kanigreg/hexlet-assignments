# frozen_string_literal: true

# rubocop:disable Style/For

def make_censored(text, stop_words)
  # BEGIN
  result = []
  for word in text.split
    result << (stop_words.include?(word) ? '$#%!' : word)
  end
  result.join(' ')
  # END
end

# rubocop:enable Style/For
