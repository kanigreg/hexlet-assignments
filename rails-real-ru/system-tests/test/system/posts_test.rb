# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
    @post_attrs = { title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph }
    @comment_attrs = { body: Faker::Lorem.sentence }
  end

  test 'creating a Post' do
    visit posts_url

    click_on 'New Post'

    fill_in 'post_title', with: @post_attrs[:title]
    fill_in 'post_body', with: @post_attrs[:body]

    click_on 'Create Post'

    assert_text 'Post was successfully created'
    click_on 'Back'
  end

  test 'updating a Post' do
    visit posts_url

    first('tbody > tr').click_link('Edit')

    fill_in 'post_title', with: @post_attrs[:title]

    click_on 'Update Post'

    assert_text 'Post was successfully updated.'

    click_on 'Back'
  end

  test 'destroing a Post' do
    visit posts_url

    accept_confirm do
      first('tbody > tr').click_link('Destroy')
    end

    assert_text 'Post was successfully destroyed'
  end

  test 'creating a PostComment' do
    visit post_url(@post)

    fill_in 'post_comment_body', with: @comment_attrs[:body]

    click_on 'Create Comment'

    assert_text 'Comment was successfully created.'
  end
end
# END
