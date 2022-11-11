# frozen_string_literal: true

json.extract! user, :id, :email, :address
json.full_name "#{user.first_name} #{user.last_name}"
json.posts do
  json.array! user.posts, partial: 'api/v1/users/post', as: :post
end
