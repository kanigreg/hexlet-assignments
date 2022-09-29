# frozen_string_literal: true

# BEGIN
def compare_versions(version1, version2)
  major1_str, minor1_str = version1.split('.')
  major2_str, minor2_str = version2.split('.')

  major1 = major1_str.to_i
  major2 = major2_str.to_i
  minor1 = minor1_str.to_i
  minor2 = minor2_str.to_i

  if (major1 <=> major2).zero?
    minor1 <=> minor2
  else
    major1 <=> major2
  end
end
# END
