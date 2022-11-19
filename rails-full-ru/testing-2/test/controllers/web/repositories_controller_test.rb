# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should create' do
    data_str = load_fixture('files/response.json')
    data = JSON.parse data_str, symbolize_names: true

    attrs = { link: "https://github.com/#{data[:owner][:login]}/#{data[:name]}"}

    stub_request(:any, "https://api.github.com/repos/#{data[:owner][:login]}/#{data[:name]}")
      .to_return(status: 200, body: data_str, headers: {'Content-Type': 'application/json; charset=utf-8'})

    post repositories_path, params: { repository: attrs }

    repo = Repository.find_by! attrs.merge(repo_name: data[:name], owner_name: data[:owner][:login])

    assert_response :redirect
    assert repo.present?
  end
  # END
end
