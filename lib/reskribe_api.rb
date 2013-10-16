require 'time'
require 'uri'
require 'net/https'
require 'json'

require 'reskribe_api/form'
require 'reskribe_api/version'
require 'reskribe_api/request'

module ReskribeApi

  class << self
    attr_accessor :api_token
    attr_accessor :ssl
    attr_accessor :api_base
  end

  class Error < StandardError; end

  module Errors
    class ServiceUnavailable < Error; end
    class AccessDenied < Error; end
    class NotFound < Error; end
    class CommunicationError < Error; end
    class ValidationError < Error; end
    class UnexpectedResponse < Error; end
  end

end
