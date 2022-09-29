# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = post_comments(:one)
    @post = @comment.post
    @attrs = {
      body: Faker::ChuckNorris.fact
    }
  end

  test 'should create comment' do
    post post_comments_url(@post), params: { post_comment: @attrs }

    comment = PostComment.find_by @attrs

    assert { comment }
    assert_redirected_to post_url(@post)
  end

  test 'should get edit' do
    get edit_post_comment_url(@post, @comment)
    assert_response :success
  end

  test 'should update post' do
    patch post_comment_url(@post, @comment), params: { post_comment: @attrs }

    @comment.reload

    assert { @comment.body == @attrs[:body] }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    delete post_comment_url(@post, @comment)

    assert { !PostComment.exists?(@comment.id) }

    assert_redirected_to post_url(@post)
  end
end
