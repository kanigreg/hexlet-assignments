# frozen_string_literal: true

require 'csv'

namespace :hexlet do
  desc 'Load users to DB'
  task :import_users, [:path] => :environment do |_, args|
    User.transaction do
      CSV.foreach(args[:path], headers: true) do |row|
        params = row.to_h.symbolize_keys
        params[:birthday] = Date.strptime(params[:birthday], '%m/%d/%Y')

        User.create!(params)
      end
    end

  rescue TypeError
    puts 'Missing file path'
  rescue Errno::ENOENT => e
    puts "Invalid file path. #{e.message}"
  rescue StandardError => e
    puts "Importing failed: #{e.message}"
  end
end
