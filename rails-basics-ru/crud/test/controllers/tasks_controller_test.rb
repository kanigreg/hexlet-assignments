require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test 'index' do
    get tasks_path

    assert_response :success
  end

  test 'new' do
    get new_task_path

    assert_response :success
  end

  test 'create' do
    task_params = {
      name: 'TestTask',
      description: 'TestDescription',
      status: 'new',
      creator: 'Tik',
      performer: 'Tak',
      completed: false
    }

    post tasks_path(task: task_params)

    assert_response :success
  end

  test 'show' do
    get task_path(@task)

    assert_response :success
  end

  test 'edit' do
    get edit_task_path(@task)

    assert_response :success
  end

  test 'update' do
    task_params = { name: 'NewTaskName' }
    put task_path(@task, task: task_params)

    assert_response :redirect

    @task.reload

    assert_equal task_params[:name], @task.name
  end

  test 'destroy' do
    delete task_path(@task)

    assert_response :redirect
  end
end
