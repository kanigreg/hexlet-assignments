require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test 'should get index' do
    get tasks_url
    assert_response :success
  end

  test 'should get new' do
    get new_task_url
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      task_params = {
        description: @task.description,
        name: @task.name,
        status_id: @task.status_id,
        user_id: @task.user_id
      }

      post tasks_url task: task_params
    end

    assert_redirected_to task_url(Task.last)
  end

  test 'should show task' do
    get task_url(@task)
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
  end

  test 'should update task' do
    task_params = {
      description: @task.description,
      name: @task.name,
      status_id: @task.status_id,
      user_id: @task.user_id
    }

    patch task_url(@task, task: task_params)
    assert_redirected_to task_url(@task)
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
