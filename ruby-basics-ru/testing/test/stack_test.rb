# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    array = [1, 2, 3, 4]
    @stack = Stack.new(array)
    @stack_size = array.size
  end

  def test_size
    assert { @stack.size == @stack_size }
  end

  def test_empty?
    refute { @stack.empty? }
  end

  def test_clear!
    @stack.clear!
    assert { @stack.empty? }
  end

  def test_to_a
    assert { @stack.to_a.instance_of? Array }
  end

  def test_pop!
    last_element = @stack.pop!

    assert { @stack.size == @stack_size - 1 }
    assert { last_element == 4 }
  end

  def test_push!
    @stack.push!(5)

    assert { @stack.size == @stack_size + 1 }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
