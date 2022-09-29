# frozen_string_literal: true

# BEGIN
module Model
  def self.included(object)
    object.extend ClassMethods
  end

  module ClassMethods
    def scheme
      @scheme ||= {}
    end

    def attribute(name, options = {})
      type, default = options.values_at(:type, :default)

      scheme[name] = { type: type, default: default }

      define_method name do
        @attributes[name]
      end

      define_method "#{name}=" do |value|
        @attributes[name] = convert_to(type, value)
      end
    end
  end

  attr_reader :attributes

  def initialize(attributes = {})
    @attributes = {}

    scheme
      .transform_values { |metadata| metadata[:default] }
      .merge(attributes)
      .filter { |attribute| scheme.key?(attribute) }
      .each { |attribute, value| send("#{attribute}=", value) }
  end

  protected

  def scheme
    self.class.scheme
  end

  def convert_to(type, value)
    return if value.nil?

    case type
    when :string
      value.to_s
    when :integer
      value.to_i
    when :boolean
      value
    when :datetime
      DateTime.parse(value)
    else
      StandartError('Unknown type in the scheme. Check your attributes.')
    end
  end
end
# END
