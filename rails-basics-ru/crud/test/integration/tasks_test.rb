require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test 'visiting index page' do
    get tasks_path

    assert_response :success
    assert_select 'h1', text: 'Tasks'
    assert_select 'p', text: 'Task1'
    assert_select 'p', text: 'Description1'
  end

  test 'visiting show page' do
    get task_path(@task)

    assert_response :success
    assert_select 'h1', text: "Task #{@task.id}"
    assert_select 'p', @task.name
  end

  test 'visiting new page' do
    get new_task_path

    assert_select 'h1', text: 'New Task'

    assert_response :success
  end

  test 'visiting edit page' do
    get edit_task_path(@task)

    assert_select 'h1', text: 'Edit Task'

    assert_response :success
  end
end
