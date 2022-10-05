# frozen_string_literal: true

require 'open-uri'

class Hacker
  class << self
    def hack(email, password)
      # BEGIN
      res = URI.open('https://rails-collective-blog-ru.hexlet.app/users/sign_up')
      cookie = res.meta['set-cookie'].split('; ').first
      doc = Nokogiri::HTML(res)
      nodes = doc.css('input[name=authenticity_token]')
      csrf_token = nodes.first[:value]
      params = {
        'authenticity_token' => csrf_token,
        'user[email]' => email,
        'user[password]' => password,
        'user[password_confirmation]' => password
      }
      http = Net::HTTP.new('rails-collective-blog-ru.hexlet.app', 443)
      http.use_ssl = true
      data = URI.encode_www_form params
      headers = { 'Cookie' => cookie }
      http.post('/users', data, headers)
      # END
    end
  end
end
