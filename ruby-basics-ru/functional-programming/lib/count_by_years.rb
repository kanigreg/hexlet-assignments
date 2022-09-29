# frozen_string_literal: true

# BEGIN
def count_by_years(data)
  data
    .filter { |user| user[:gender] == 'male' }
    .each_with_object(Hash.new(0)) do |user, acc|
      birthday = user[:birthday][0, 4]
      acc[birthday] += 1
    end
end
# END
