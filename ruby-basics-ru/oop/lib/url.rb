# frozen_string_literal: true

# BEGIN
require 'forwardable'
require 'uri'

class Url
  include Comparable
  extend Forwardable

  def initialize(url)
    @uri = URI(url)
  end

  def_delegators :@uri, :scheme, :host

  def query_params
    return @query_params unless @query_params.nil?

    return {} if @uri.query.nil?

    @query_params = @uri.query.split('&').each_with_object({}) do |param, acc|
      key, value = param.split('=')
      acc[key.to_sym] = value
    end
    @query_params
  end

  def query_param(key, default_value = nil)
    query_params[key] || default_value
  end

  def <=>(other)
    return unless other.instance_of? Url

    @uri.to_s <=> other.uri.to_s
  end

  protected

  attr_reader :uri
end
# END
