# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(params)
  result = []
  sorted_params = params.sort
  for (param, value) in sorted_params
    result << "#{param}=#{value}"
  end
  result.join('&')
end
# END
# rubocop:enable Style/For
