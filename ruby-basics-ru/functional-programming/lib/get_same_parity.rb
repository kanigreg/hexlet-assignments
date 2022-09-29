# frozen_string_literal: true

# BEGIN
def get_same_parity(nums)
  return [] if nums.empty?

  filter_func_name = nums.first.odd? ? :odd? : :even?
  nums.filter(&filter_func_name)
end
# END
